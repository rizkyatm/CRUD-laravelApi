<h1>daftar guru</h1>
<table>
    <thead>
        <tr>
            <th>no_induk_pegawai</th>
            <th>nama_lenkap</th>
            <th>mata_pelajaran</th>
            <th>tanggal_lahir</th>
            <th>jenis_kelamin</th>
            <th>email</th>
            <th>password</th>
        </tr>
    </thead>
    <tbody>
    @foreach ($gurus as $guru)
    <tr>
        <th>{{$guru->no_induk_pegawai}}</th>
        <th>{{$guru->nama_lenkap}}</th>
        <th>{{$guru->mata_pelajaran}}</th>
        <th>{{$guru->tanggal_lahir}}</th>
        <th>{{$guru->jenis_kelamin}}</th>
        <th>{{$guru->email}}</th>
        <th>{{$guru->password}}</th>
        <td><a href="/guru/{{$guru->id}}/edit">edit</a></td>
       <td> <form action="/guru/{{$guru->id}}" method="POST">
        @method('DELETE')
        @csrf
        <input type="submit" value="delete">
        </form></td>
    </tr>          
    @endforeach

    </tbody>
</table>
<a href="/guru/create">tambah guru</a>