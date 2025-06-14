# 📱 CatatanTodo

**CatatanTodo** adalah aplikasi *To-Do List* berbasis **Flutter** yang terintegrasi dengan **Laravel REST API** sebagai backend-nya. Aplikasi ini dirancang untuk membantu pengguna dalam mengelola tugas harian secara efisien dan terorganisir.

Dengan antarmuka yang sederhana dan ramah pengguna, CatatanTodo memungkinkan kamu untuk:
- Menambahkan tugas penting harian atau mingguan.
- Mengatur deadline dan prioritas tugas (low, medium, high).
- Menandai tugas yang sudah selesai agar tidak terlewat.
- Menyimpan data secara aman ke dalam server menggunakan API.

Aplikasi ini cocok digunakan oleh pelajar, mahasiswa, hingga profesional yang ingin menjaga produktivitas tetap terkontrol.

Proyek ini dibuat sebagai bagian dari pembelajaran pengembangan aplikasi mobile dan backend API, dengan menggabungkan teknologi modern Flutter dan Laravel dalam satu kesatuan sistem yang solid.

---

## 🧩 Deskripsi Aplikasi

### 🔹 Fitur Utama
- Register & Login
- Tambah, edit, dan hapus tugas
- Tandai tugas sebagai selesai
- Filter berdasarkan prioritas dan tanggal
- Halaman profil pengguna

### 📄 Halaman
- Login
- Register
- Home / Daftar Tugas
- Form Tambah / Edit Tugas
- Profil
- Logout

---

## 🗃️ Database

- **Jenis**: MySQL  
- File backup tersedia di:  
  `database/todotodo.sql`

### Tabel Utama:
- `users` – data pengguna
- `tasks` – data tugas pengguna

---

## 🌐 API (Laravel)

Dibuat menggunakan **Laravel versi 12.18.0** dan **Sanctum** untuk autentikasi token.

| Method | Endpoint         | Fungsi             |
|--------|------------------|--------------------|
| POST   | /api/register    | Registrasi user    |
| POST   | /api/login       | Login user         |
| GET    | /api/tasks       | Ambil semua tugas  |
| POST   | /api/tasks       | Tambah tugas       |
| PUT    | /api/tasks/{id}  | Update tugas       |
| DELETE | /api/tasks/{id}  | Hapus tugas        |

---

## 🛠️ Software yang Digunakan

| Kebutuhan   | Teknologi          |
|-------------|--------------------|
| Frontend    | Flutter             |
| Backend     | Laravel 12          |
| Database    | MySQL               |
| Code Editor | Visual Studio Code  |
| API Tester  | Postman             |
| Versioning  | Git & GitHub        |

---
  
## ⚙️ Cara Instalasi

### 📲 Frontend (Flutter)
```bash
git clone https://github.com/Rafila258/CatatanTodo.git
cd todoflutter
flutter pub get
flutter run
``` 

### 🌐 Backend (Laravel)
```bash
cd todolist
composer install
cp .env.example .env
php artisan key:generate
```

- Edit file `.env` dan sesuaikan konfigurasi database kamu.
- Import file `database/todotodo.sql` ke **phpMyAdmin** atau database lokal kamu.
- Jalankan server Laravel:
```
php artisan serve
```

## 🎬 Demo Aplikasi

📽️ Simulasi penggunaan aplikasi dapat ditonton melalui link berikut:  
🔗 [Lihat Video Demo di Google Drive](https://drive.google.com/drive/u/0/folders/1nzyfFVmdks3SW4vh6Hv7-kDbVLsB7Tay)

> 💡 Karena ukuran video cukup besar, maka hanya ditampilkan dalam bentuk link.

---

## 👩‍💻 Identitas Pembuat

- **Nama**: Rafila Shofiya Dewi  
- **Kelas**: XI RPL 1  
- **Sekolah**: SMK Negeri 1 Bantul


