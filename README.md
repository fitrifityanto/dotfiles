# Dotfiles

Selamat datang di repo dotfiles saya\! Repositori ini berisi konfigurasi pribadi untuk berbagai aplikasi yang saya gunakan. Saat ini, hanya berisi konfigurasi untuk **Neovim**.

---

## 💻 Neovim

Di bagian ini, saya akan menjelaskan cara menginstal dan menggunakan konfigurasi Neovim pribadi saya.

<details>
<summary>Cara Setup</summary>

### 📄 Prasyarat

Untuk menggunakan konfigurasi ini, pastikan Anda telah menginstal beberapa _tools_ berikut:

- **Neovim** (versi 0.9.0 atau yang lebih baru)
- **Git**: Digunakan untuk mengelola _source code_ dan mengunduh _plugin_.
- **Node.js**: Diperlukan oleh beberapa _plugin_ Neovim, terutama yang berhubungan dengan _Language Server Protocol_ (LSP).
- **Python 3**: Digunakan sebagai _host_ untuk beberapa _plugin_ dan _Language Server_.
- **ripgrep**: **`rg`** adalah _tool_ pencarian yang sangat cepat untuk _string_ di dalam _file_. Digunakan oleh _plugin_ seperti Telescope.
- **fd**: Alternatif yang cepat dan mudah untuk perintah `find` bawaan Linux. Digunakan untuk mencari _file_ dengan cepat di dalam _project_.

### 📝 Rekomendasi

- **Nerd Fonts**: Sangat direkomendasikan untuk menampilkan ikon dan simbol dengan benar di _terminal_ Anda. Anda dapat mengunduh dan menginstal _font_ ini untuk mendapatkan pengalaman visual yang optimal.

### ⚙️ Instalasi

Anda memiliki dua opsi untuk menginstal konfigurasi ini:

#### Opsi 1: Menggunakan Symlink (Direkomendasikan)

Metode ini paling efisien jika Anda berencana untuk selalu menjaga konfigurasi Anda tetap sinkron dengan repositori ini.

1.  **Clone** repositori ini ke dalam direktori lokal Anda.
    ```bash
    git clone https://github.com/fitrifityanto/dotfiles.git
    ```
2.  **Backup** konfigurasi Neovim Anda yang sudah ada (jika ada).
    ```bash
    mv ~/.config/nvim ~/.config/nvim.bak
    ```
3.  **Symlink** konfigurasi Neovim dari folder `dotfiles` ke direktori `$HOME/.config`.
    ```bash
    ln -s ~/dotfiles/nvim ~/.config/nvim
    ```

#### Opsi 2: Salin Langsung

Jika Anda hanya ingin menyalin konfigurasi Neovim ini tanpa mengelola `symlink`.

1.  **Clone** repositori ini.

    ```bash
    git clone https://github.com/fitrifityanto/dotfiles.git ~/dotfiles
    ```

2.  **Backup** konfigurasi Neovim Anda yang sudah ada (jika ada).

    ```bash
    mv ~/.config/nvim ~/.config/nvim.bak
    ```

3.  **Salin** folder `nvim` ke direktori `.config` Anda.

    ```bash
    cp -r dotfiles/nvim ~/.config/
    ```

4.  **Buka Neovim**. Proses instalasi _plugin_ akan berjalan secara otomatis menggunakan **Lazy.nvim**.

### ✨ Plugin & Fitur

Berikut adalah beberapa _plugin_ utama yang saya gunakan:

- **Lazy.nvim**: _Plugin Manager_
- **Telescope**: _Fuzzy finder_
- **LSP (Language Server Protocol)**: Untuk fitur _autocomplete_, _hover documentation_, dan navigasi kode.
- **Treesitter**: Untuk _highlighting_ sintaksis yang lebih baik.
- **Catppuccin**: _Colorscheme_ yang saya gunakan.
- **Bufferline**: Menampilkan _tab bar_ untuk _buffer_.
- **Lualine**: _Status line_ yang informatif.
- **Neo-tree**: _File explorer_ di dalam Neovim.
- **Cmp**: _Completion plugin_.
- **Nvim-ufo**: _Folding plugin_.

</details>

---

Jika Anda memiliki saran atau menemukan _bug_, silakan buat _issue_ atau _pull request_ di GitHub.
