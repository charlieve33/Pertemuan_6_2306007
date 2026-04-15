📱 Flutter Login Form App

Aplikasi sederhana menggunakan Flutter yang menampilkan form login dengan validasi input untuk username dan password.

🚀 Fitur
Input Username dan Password
Validasi form:
Username minimal 4 karakter
Password minimal 4 karakter
Password disembunyikan (secure input)
Menampilkan notifikasi menggunakan SnackBar saat login berhasil

🖼️ Tampilan UI
Komponen utama:

AppBar dengan judul "Halaman Login"
TextFormField untuk username
TextFormField untuk password (dengan obscureText)
Tombol Login
⚠️ Catatan
Fungsi LoginPage() di dalam _LoginPageState tidak digunakan, karena logika login sudah langsung ditangani di tombol onPressed.
Untuk pengembangan lebih lanjut, sebaiknya:
Tambahkan autentikasi backend
Gunakan enkripsi password
Pisahkan logic ke dalam service atau controller
