<form action="/guru/{{$guru->id}}" method="POST">
    @method('PUT')
    @csrf
    <input type="number" name="no_induk_pegawai" value="{{$guru->no_induk_pegawai}}">no_induk_pegawai <br>
    <input type="text" name="nama_lenkap" value="{{$guru->nama_lenkap}}">nama_lenkap<br>
    <input type="text" name="mata_pelajaran" value="{{$guru->mata_pelajaran}}" >mata_pelajaran<br>
    <input type="date" name="tanggal_lahir"value = "{{$guru->tanggal_lahir}}" >tanggal_lahir<br>
    <input type="text" name="jenis_kelamin"value=" {{$guru->jenis_kelamin}}">jenis_kelamin<br>
    <input type="text" name="email" value="{{$guru->email}}" >email<br>
    <input type="text" name="password" value="{{$guru->password}}" >password <br>
    <input type="submit" value="edit ">
</form>