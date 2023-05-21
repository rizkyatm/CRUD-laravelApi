<form action="/guru" method="POST">
    @csrf
    <input type="number" name="no_induk_pegawai">no_induk_pegawai <br>
    <input type="text" name="nama_lenkap">nama_lenkap<br>
    <input type="text" name="mata_pelajaran">mata_pelajaran<br>
    <input type="date" name="tanggal_lahir">tanggal_lahir<br>
    <input type="text" name="jenis_kelamin">jenis_kelamin<br>
    <input type="text" name="email">email<br>
    <input type="text" name="password">password <br>
    <input type="submit" value="simpan">
</form>