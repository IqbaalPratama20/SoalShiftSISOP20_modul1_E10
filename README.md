# SoalShiftSISOP20_modul1_E10

**Soal 1**  Whits adalah seorang mahasiswa teknik informatika. Dia mendapatkan tugas praktikum untuk membuat laporan berdasarkan data yang ada pada file “Sample-Superstore.tsv”. Namun dia tidak dapat menyelesaikan tugas tersebut. Laporan yang diminta berupa :

a. Tentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling sedikit.
b. Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling sedikit berdasarkan hasil poin a.
c. Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling sedikit berdasarkan 2 negara bagian (state) hasil poin b.

Whits memohon kepada kalian yang sudah jago mengolah data untuk mengerjakan laporan tersebut.

Penyelesaian
a. Tentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling sedikit


-      awk -F "\t" 'NR > 1 {arr[$13]+=$21}
Bagian ini berfungsi untuk melakukan iterasi ke setiap kolom dengan "\t" sebagai pemisah tiap-tiap kata. Lalu  -F digunakan untuk memanggil file yang berisi perintah awk untuk dijalankan (tidak perlu menulis syntax satu baris). NR berfungsi untuk menghitung total record yang diakses NR > 1 mengecualikan record pertama.  Lalu kita melakukan perulangan untuk kolom ke 13 dan menjadikan setiap value di kolom tersebut sebagai index di array arr dan setiap mendapatkan nilai yang memiliki kesamaan dengan index maka jumlahkan valuenya dan diletakkan pada index tersebut. 

Kemudian setelah penghitungan jumlah profit per region selesai, dilakukan sorting pada value array menggunakan fungsi asort diman n menunjukkan panjang array dan min merupakan array yang akan dijadikan array baru setelah di sort. Sehingga nilai dari array min[1] merupakan profit yang paling kecil dan seterusnya hingga min[n] yang berisi profit terbesar

Selanjutnya dengan menggunakan perulangan untuk value indeks pada array arr dan perulangan hingga panjang maksimum array min, maka ketika nilai arr[i] sama dengan min[a] maka kita menambah array baru yaitu ind yang nantinya berisi nilai i dimana array ini merupakan array yang menunjukkan urutan region dengan profit paling sedikit hingga paling banyak
Setelah itu dicetak array ind dengan indeks 1 yang mana menunjukkan region dengan profit terkecil

b. Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling sedikit berdasarkan hasil poin a.


Hampir sama seperti nomor 1a namun disini acuan yang digunakan sebagai untuk acuan perulangan adalah hasil nomor 1a dimana yaitu dengan menggunakan command -v untuk melakukan passing variabel pada hasil sebelumnya. Disini dicari dua variabel yaitu state1 dan state2 , hal ini dilakukan agar nantinya dapat melakukan passing variabel tersebut dalam mengerjakan nomor 1 c

Bagian ini berfungsi untuk melakukan iterasi ke setiap kolom dengan "\t" sebagai pemisah tiap-tiap kata. Lalu  F digunakan untuk memanggil file yang berisi perintah awk untuk dijalankan (tidak perlu menulis syntax satu baris).   Lalu kita melakukan perulangan untuk kolom ke 11  acuan variabel reg1 yang terisi hasil passing dari variabel reg pada hasil no 1a dan menjadikan setiap value di kolom 11 tersebut sebagai index di array arr dan setiap mendapatkan nilai yang memiliki kesamaan dengan index maka jumlahkan valuenya dan diletakkan pada index tersebut. 

Kemudian setelah penghitungan jumlah profit per region selesai, dilakukan sorting pada value array menggunakan fungsi asort diman n menunjukkan panjang array dan min merupakan array yang akan dijadikan array baru setelah di sort. Sehingga nilai dari array min[1] merupakan profit yang paling kecil dan seterusnya hingga min[n] yang berisi profit terbesar

Selanjutnya dengan menggunakan perulangan untuk value indeks pada array arr dan perulangan hingga panjang maksimum array min, maka ketika nilai arr[i] sama dengan min[a] maka kita menambah array baru yaitu ind yang nantinya berisi nilai i dimana array ini merupakan array yang menunjukkan urutan region dengan profit paling sedikit hingga paling banyak
Setelah itu dicetak array ind dengan indeks 1 yang mana menunjukkan state dengan profit terkecil
sebagai state1 dan dicetak array ind dengan indeks 2 yang mana menunjukkan state dengan profit terkecil kedua 

c. Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling sedikit berdasarkan 2 negara bagian (state) hasil poin b.

Hampir sama seperti nomor 1a namun disini acuan yang digunakan sebagai untuk acuan perulangan adalah dua hasil pada nomor 1b dimana yaitu dengan menggunakan command -v untuk melakukan passing variabel pada hasil sebelumnya. 

Bagian ini berfungsi untuk melakukan iterasi ke setiap kolom dengan "\t" sebagai pemisah tiap-tiap kata. Lalu  F digunakan untuk memanggil file yang berisi perintah awk untuk dijalankan (tidak perlu menulis syntax satu baris).   Lalu kita melakukan perulangan untuk kolom ke 17 dengan  acuan variabel state1 dan state2 yang terisi hasil passing dari variabel sta1 dan sta2 pada hasil no 1b dan menjadikan setiap value di kolom 17 tersebut sebagai index di array arr dan setiap mendapatkan nilai yang memiliki kesamaan dengan index maka jumlahkan valuenya dan diletakkan pada index tersebut. 

Kemudian setelah penghitungan jumlah profit per region selesai, dilakukan sorting pada value array menggunakan fungsi asort diman n menunjukkan panjang array dan min merupakan array yang akan dijadikan array baru setelah di sort. Sehingga nilai dari array min[1] merupakan profit yang paling kecil dan seterusnya hingga min[n] yang berisi profit terbesar

Selanjutnya dengan menggunakan perulangan untuk value indeks pada array arr dan perulangan hingga panjang maksimum array min, maka ketika nilai arr[i] sama dengan min[a] maka kita menambah array baru yaitu ind yang nantinya berisi nilai i dimana array ini merupakan array yang menunjukkan urutan region dengan profit paling sedikit hingga paling banyak
Setelah itu dicetak array ind dengan indeks 1 hingga indeks 10 dengan menggunakan perulangan for dimana akan menghasilkan 10 nama produk dengan profit terkecil pada state hasil no 1b

**Soal 2**

Penyelesaian a:
**Penyelesaian b:**

    inode=$(stat -c '%i' "$1")
- Stat berfungsi untuk menampilkan semua status dari file, dalam hal ini  $1 menjadi filenya dan $i mendapatkan inode dari file tersebut lalu -c befungsi untuk formatting.

	    fs=$(df --output=source "$1" | tail -1)
- df digunakan untuk mengambil informasi mengenai device name, total blocks, total disk space, used disk space, available disk space and mount points pada file system lalu dispesifikasi untuk file $1 dan diambol keterangan pada baris terakhir.

It can be used to examine and change the state of an ext2 file system.

    crtime=$(sudo debugfs -R 'stat <'"${inode}"'>' "${fs}" 2>/dev/null | grep -oP 'crtime.*--\s*\K.*')
- debugfs -R digunakan untuk melihat perubahan dari file yang berada pada lokasi `/dev/null` is the null device it takes any input you want and throws it away. It can be used to suppress any output. adalah null device yang mengambil semua input dan membuangnya dan diambil seperlunya, 2 berarti kita membuang hasil debug stat yang berisi error. Lalu setelah mendapatkan output yang diinginkan maka kita lakukan grep pada hasil itu dengan params -o yang berarti hanya yang cocok dengan  'crtime.*--\s*\K.*' yang crtime sendiri itu menghasilkan date dan harus dibaca dengan PCRE (`-P`) untuk ekstraksi data yang diinginkan dan digunakan untuk input `date` yaitu crtime yang ditambah dengan params \s dan \K. Hasil dari crtime adalah hari bulan tahun jam dan sebagainya.


    
	    hours=$(echo $times | cut -d':' -f1) 
	    times=$(echo $crtime | cut -d' ' -f4)
- Hours akan berisi jam dari hasil crtime dengan melakukan cut spasi dan mengambil bagian 4 (posisinya di kolom ke empat ketika melakukan cut)
- Times akan mendapatkan jamnya saja (04:20:sekian) dengan melakukan cut : dan mengambil kolom pertama
- 

    conv_hours=$((10#$hours))	 
- Digunakan untuk melakukan konversi dari string ke integer base 10 (karena times sebelumnya adalah string)

	    kamusa=('a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z')
    
	    kamusb=('A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L' 'M' 'N' 'O' 'P' 'Q' 'R' 'S' 'T' 'U' 'V' 'W' 'X' 'Y' 'Z')
    
	    tempone=${kamusa[$conv_hours]}
    
	    tempones=${kamusa[$conv_hours-1]}
    
	    tumpone=${kamusb[$conv_hours]}
    
	    tumpones=${kamusb[$conv_hours-1]}
    
	    name_file="$(echo "$filename" | tr ["$tempone"-za-"$tempones"] [a-z] | tr ["$tumpone"-ZA-"$tumpones"] [A-Z])"
    
	    name_file+=".txt"

	    # echo $1

	    mv $1 $name_file
- kamusa dan kamusb berisi hardcode alfabet dari a sampai z untuk huruf besar dan kecil lalu tempone digunakan untuk menyimpan huruf pada index ke jam dan tempones digunakan untuk menyimpan index ke jam-1, begitu juga untuk tumpone dan tumpones. Lalu name_file akan berisi hasil encrypt dari file name dengan menggunakan modifikasi dari ROT13 chiper yaitu ketika kita ingin melakukan shift sesuai jam maka ketika jam nya 1 a menjadi b atau b menjadi c, ROT 13 chiper bekerja dengan ketika a maka menjadi huruf apa sehingga a-za-b yaitu huruf input pertama menjadi a dengan command tr (translate), dan cara itu digunakan untuk melakukan translate ke semua huruf, -za- berarti untuk huruf kecil dan -ZA- berarti huruf kapital. Hasil dari encrypt digunakan untuk nama file baru.

**Penyelesaian c:**

    inode=$(stat -c '%i' "$1")
- Stat berfungsi untuk menampilkan semua status dari file, dalam hal ini  $1 menjadi filenya dan $i mendapatkan inode dari file tersebut lalu -c befungsi untuk formatting.

	    fs=$(df --output=source "$1" | tail -1)
- df digunakan untuk mengambil informasi mengenai device name, total blocks, total disk space, used disk space, available disk space and mount points pada file system lalu dispesifikasi untuk file $1 dan diambol keterangan pada baris terakhir.

It can be used to examine and change the state of an ext2 file system.

    crtime=$(sudo debugfs -R 'stat <'"${inode}"'>' "${fs}" 2>/dev/null | grep -oP 'crtime.*--\s*\K.*')
- debugfs -R digunakan untuk melihat perubahan dari file yang berada pada lokasi `/dev/null` is the null device it takes any input you want and throws it away. It can be used to suppress any output. adalah null device yang mengambil semua input dan membuangnya dan diambil seperlunya, 2 berarti kita membuang hasil debug stat yang berisi error. Lalu setelah mendapatkan output yang diinginkan maka kita lakukan grep pada hasil itu dengan params -o yang berarti hanya yang cocok dengan  'crtime.*--\s*\K.*' yang crtime sendiri itu menghasilkan date dan harus dibaca dengan PCRE (`-P`) untuk ekstraksi data yang diinginkan dan digunakan untuk input `date` yaitu crtime yang ditambah dengan params \s dan \K. Hasil dari crtime adalah hari bulan tahun jam dan sebagainya.


    
	    hours=$(echo $times | cut -d':' -f1) 
	    times=$(echo $crtime | cut -d' ' -f4)
- Hours akan berisi jam dari hasil crtime dengan melakukan cut spasi dan mengambil bagian 4 (posisinya di kolom ke empat ketika melakukan cut)
- Times akan mendapatkan jamnya saja (04:20:sekian) dengan melakukan cut : dan mengambil kolom pertama
- 

    conv_hours=$((10#$hours))	 
- Digunakan untuk melakukan konversi dari string ke integer base 10 (karena times sebelumnya adalah string)

	    kamusa=('a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z')
    
	    kamusb=('A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L' 'M' 'N' 'O' 'P' 'Q' 'R' 'S' 'T' 'U' 'V' 'W' 'X' 'Y' 'Z')
    
	    tempone=${kamusa[$conv_hours]}
    
	    tempones=${kamusa[$conv_hours-1]}
    
	    tumpone=${kamusb[$conv_hours]}
    
	    tumpones=${kamusb[$conv_hours-1]}
    
	    name_file="$(echo "$filename" | tr [a-z] ["$tempone"-za-"$tempones"] | tr [A-Z] ["$tumpone"-ZA-"$tumpones"])"
    
	    name_file+=".txt"

	    # echo $1

	    mv $1 $name_file
- kamusa dan kamusb berisi hardcode alfabet dari a sampai z untuk huruf besar dan kecil lalu tempone digunakan untuk menyimpan huruf pada index ke jam dan tempones digunakan untuk menyimpan index ke jam-1, begitu juga untuk tumpone dan tumpones. Lalu name_file akan berisi hasil encrypt dari file name dengan menggunakan modifikasi dari ROT13 chiper yaitu ketika kita ingin melakukan shift sesuai jam maka ketika jam nya 1 a menjadi b atau b menjadi c, ROT 13 chiper bekerja dengan ketika a maka menjadi huruf apa sehingga a-za-b yaitu huruf input pertama menjadi a dengan command tr (translate), dan cara itu digunakan untuk melakukan translate ke semua huruf, -za- berarti untuk huruf kecil dan -ZA- berarti huruf kapital. Hasil dari encrypt digunakan untuk nama file baru. Untuk decrypt maka dilakukan sebaliknya dengan membalik tr [ -za- ] dan [a-z] menjadi [a-z] dan [ -za- ].
