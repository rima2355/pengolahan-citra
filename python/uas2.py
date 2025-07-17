import os
import cv2
import numpy as np
import tkinter as tk
from tkinter import filedialog, messagebox
import matplotlib.pyplot as plt
from sklearn.metrics.pairwise import cosine_similarity

# === SETUP PATH DATASET ===
dataset_path = r'C:\rima\python\train_zip\train'  # Ganti sesuai lokasi folder kamu

# === INISIALISASI LIST DATASET ===
image_paths = []
image_features = []
file_names = []

# === EKSTRAK FITUR WARNA (HSV Histogram) ===
def extract_color_features(image, bins=(8, 8, 8)):
    hsv = cv2.cvtColor(image, cv2.COLOR_RGB2HSV)
    hist = cv2.calcHist([hsv], [0, 1, 2], None, bins, [0, 180, 0, 256, 0, 256])
    cv2.normalize(hist, hist)
    return hist.flatten()

# === Load Dataset & Ekstrak Fitur ===
def load_dataset():
    for file in os.listdir(dataset_path):
        if file.lower().endswith(('.jpg', '.jpeg', '.png')):
            path = os.path.join(dataset_path, file)
            img = cv2.imread(path)
            if img is None:
                continue
            img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
            feat = extract_color_features(img)
            image_paths.append(path)
            image_features.append(feat)
            file_names.append(file)
    print(f"{len(file_names)} gambar dimuat dari dataset.")

# === Tampilkan Gambar Paling Mirip ===
def show_results(query_img):
    query_feat = extract_color_features(query_img)
    similarities = cosine_similarity([query_feat], image_features)[0]
    idx_terbaik = np.argmax(similarities)
    nilai_kemiripan = similarities[idx_terbaik] * 100  # jadi persen

    img_hasil = cv2.imread(image_paths[idx_terbaik])
    img_hasil = cv2.cvtColor(img_hasil, cv2.COLOR_BGR2RGB)

    # Tampilkan query & hasil
    plt.figure(figsize=(8, 4))

    plt.subplot(1, 2, 1)
    plt.imshow(query_img)
    plt.title("Query")
    plt.axis('off')

    plt.subplot(1, 2, 2)
    plt.imshow(img_hasil)
    plt.title(f"Mirip: {nilai_kemiripan:.2f}%\n({file_names[idx_terbaik]})")
    plt.axis('off')

    plt.tight_layout()
    plt.show()

# === Fungsi Pilih Gambar ===
def pilih_gambar():
    path = filedialog.askopenfilename(title="Pilih gambar", filetypes=[("Image files", "*.jpg *.png *.jpeg")])
    if not path:
        return
    img = cv2.imread(path)
    if img is None:
        messagebox.showerror("Error", "Gambar tidak bisa dibaca.")
        return
    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    show_results(img)

# === GUI Aplikasi ===
load_dataset()

root = tk.Tk()
root.title("CBIR - Pencocokan Warna Saja")
root.geometry("400x160")

label = tk.Label(root, text="Cari Gambar Paling Mirip (1 hasil)")
label.pack(pady=10)

btn = tk.Button(root, text="Pilih Gambar Query", command=pilih_gambar)
btn.pack(pady=10)

root.mainloop()
