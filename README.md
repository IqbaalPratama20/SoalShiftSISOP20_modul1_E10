# SoalShiftSISOP20_modul1_E10

**Soal 1**  Whits adalah seorang mahasiswa teknik informatika. Dia mendapatkan tugas praktikum untuk membuat laporan berdasarkan data yang ada pada file “Sample-Superstore.tsv”. Namun dia tidak dapat menyelesaikan tugas tersebut. Laporan yang diminta berupa :

a. Tentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling sedikit.
b. Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling sedikit berdasarkan hasil poin a.
c. Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling sedikit berdasarkan 2 negara bagian (state) hasil poin b.

Whits memohon kepada kalian yang sudah jago mengolah data untuk mengerjakan laporan tersebut.

Penyelesaian
a. Tentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling sedikit



`awk -F "\t" 'NR > 1 {arr[$13]+=$21}`

Bagian ini berfungsi untuk melakukan iterasi ke setiap kolom dengan "\t" sebagai pemisah tiap-tiap kata. Lalu -F digunakan untuk memanggil file yang berisi perintah awk untuk dijalankan (tidak perlu menulis syntax satu baris). NR berfungsi untuk menghitung total record yang diakses NR > 1 mengecualikan record pertama. Lalu kita melakukan perulangan untuk kolom ke 13 dan menjadikan setiap value di kolom tersebut sebagai index di array arr dan setiap mendapatkan nilai yang memiliki kesamaan dengan index maka jumlahkan valuenya dan diletakkan pada index tersebut.

`n=asort(arr,min)`

Kemudian setelah penghitungan jumlah profit per region selesai, dilakukan sorting pada value array menggunakan fungsi asort dimana n menunjukkan panjang array dan min merupakan array yang akan dijadikan array baru setelah di sort. Sehingga nilai dari array min[1] merupakan profit yang paling kecil dan seterusnya hingga min[n] yang berisi profit terbesar

`for(i in arr){for(a=1;a<=n;a++){if(arr[i]==min[a])ind[a]=i}}; print ind[1]}`

Selanjutnya dengan menggunakan perulangan untuk value indeks pada array arr dan perulangan hingga panjang maksimum array min, maka ketika nilai `arr[i]` sama dengan `min[a]` maka kita menambah array baru yaitu `ind` yang nantinya berisi nilai i dimana array ini merupakan array yang menunjukkan urutan region dengan profit paling sedikit hingga paling banyak Setelah itu dicetak array `ind` dengan indeks 1 yang mana menunjukkan region dengan profit terkecil

b. Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling sedikit berdasarkan hasil poin a.


Hampir sama seperti nomor 1a namun disini acuan yang digunakan sebagai untuk acuan perulangan adalah hasil nomor 1a dimana yaitu dengan menggunakan command `-v` untuk melakukan passing variabel pada hasil sebelumnya. Disini dicari dua variabel yaitu `sta1` sebagai state dengan profit terendah dan `sta2` sebagai state dengan profit kedua terendah, hal ini dilakukan agar nantinya dapat melakukan passing variabel tersebut dalam mengerjakan nomor 1 c

`awk -F "\t" -v reg1=$reg '$13 ~ reg1 {arr[$11]+=$21}`

Bagian ini berfungsi untuk melakukan iterasi ke setiap kolom dengan "\t" sebagai pemisah tiap-tiap kata. Lalu F digunakan untuk memanggil file yang berisi perintah awk untuk dijalankan (tidak perlu menulis syntax satu baris). `-v reg1=$reg13` dimaksudkan kita menggunakan variabel yang bernama reg1 yang isinya sama dengan variabel `$reg` yang merupakan hasil dari soal 1a atau berisi region dengan profit terkecil. Lalu kita melakukan perulangan untuk kolom ke 11 acuan variabel `reg1` yang terisi hasil passing dari variabel `reg` pada hasil no 1a dan menjadikan setiap value di kolom 11 tersebut sebagai index di array `arr` dan setiap mendapatkan nilai yang memiliki kesamaan dengan index maka jumlahkan valuenya dan diletakkan pada index tersebut.

`n=asort(arr,min)`

Kemudian setelah penghitungan jumlah profit per region selesai, dilakukan sorting pada value array menggunakan fungsi asort diman n menunjukkan panjang array dan min merupakan array yang akan dijadikan array baru setelah di sort. Sehingga nilai dari array min[1] merupakan profit yang paling kecil dan seterusnya hingga min[n] yang berisi profit terbesar

`for(i in arr){for(a=1;a<=n;a++){if(arr[i]==min[a])ind[a]=i}}`

Selanjutnya dengan menggunakan perulangan untuk value indeks pada array `arr` dan perulangan hingga panjang maksimum array `min`, maka ketika nilai `arr[i]` sama dengan `min[a]` maka kita menambah array baru yaitu ind yang nantinya berisi nilai i dimana array ini merupakan array yang menunjukkan urutan region dengan profit paling sedikit hingga paling banyak

`print ind[1]`
`print ind[2]`

Setelah itu dicetak array `ind` dengan indeks 1 yang mana menunjukkan state dengan profit terkecil sebagai state1 dan dicetak array `ind `dengan indeks 2 yang mana menunjukkan state dengan profit terkecil kedua

c. Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling sedikit berdasarkan 2 negara bagian (state) hasil poin b.

Hampir sama seperti nomor 1a namun disini acuan yang digunakan sebagai untuk acuan perulangan adalah dua hasil pada nomor 1b dimana yaitu dengan menggunakan command `-v` untuk melakukan passing variabel pada hasil sebelumnya.
```
awk -F "\t"  -v state1=$sta1  -v state2=$sta2  '$11 ~ state1 {arr[$17]+=$21}$11 ~ state2 {arr[$17]+=$21}
```
Bagian ini berfungsi untuk melakukan iterasi ke setiap kolom dengan "\t" sebagai pemisah tiap-tiap kata. `-v state1=$sta1` dan ‘`-v state2=$sta2`dimaksudkan kita menggunakan variabel yang bernama `state1` dan `state2` yang isinya sama dengan variabel `$sta1` dan `$sta2` yang merupakan hasil dari soal 1b atau berisi 2 state dengan profit terkecil. Lalu F digunakan untuk memanggil file yang berisi perintah awk untuk dijalankan (tidak perlu menulis syntax satu baris). Lalu kita melakukan perulangan untuk kolom ke 17 dengan acuan variabel `state1` dan `state2` yang terisi hasil passing dari variabel `sta1` dan `sta2` pada hasil no 1b dan menjadikan setiap value di kolom 17 tersebut sebagai index di array `arr` dan setiap mendapatkan nilai yang memiliki kesamaan dengan index maka jumlahkan valuenya dan diletakkan pada index tersebut.

`n=asort(arr,min)`

Kemudian setelah penghitungan jumlah profit per region selesai, dilakukan sorting pada value array menggunakan fungsi asort diman n menunjukkan panjang array dan min merupakan array yang akan dijadikan array baru setelah di sort. Sehingga nilai dari array min[1] merupakan profit yang paling kecil dan seterusnya hingga min[n] yang berisi profit terbesar

`for(i in arr){for(a=1;a<=n;a++){if(arr[i]==min[a])ind[a]=i}}`

Selanjutnya dengan menggunakan perulangan untuk value indeks pada array arr dan perulangan hingga panjang maksimum array min, maka ketika nilai `arr[i]` sama dengan `min[a]` maka kita menambah array baru yaitu ind yang nantinya berisi nilai i dimana array ini merupakan array yang menunjukkan urutan region dengan profit paling sedikit hingga paling banyak

`for(i=1;i<=10;i++){print ind[i]}`

Setelah itu dicetak array ind dengan indeks 1 hingga indeks 10 dengan menggunakan perulangan for dimana akan menghasilkan 10 nama produk dengan profit terkecil pada state hasil no 1b

**Soal 2**

**Penyelesaian a:**
  1)  if [ ! -e $1 ]
    then
  2)  c=$1;
  3) if [[ $c =~ [0-9] ]]
    then
    echo "Input contain number"
    else
    4) c+=".txt";
    5) NEW_UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 28 | head -n 1)
    6) echo $NEW_UUID >> $c
    fi
    fi
    
- Baris 1 digunakan untuk melakukan pengecekan kalau file yang kita inputkan ada di directory pada saat ini dan jika tidak ada maka bisa melakukan create.
- Baris 2 c menyimpan nama file lalu dilakukan checking apabila mengandung angka, ketika iya maka tidak jadi membuat file.
- Baris 4 jika tidak, nama tersebut ditambah format .txt.
- Baris 5 untuk membuat kalimat random dengan mengambil huruf dan angka random dari /dev/urandom dan membatasi panjang dengan fold dan hanya mengambil bagian awal saja dengan head -n 1, tr dengan parameter -dc digunakan untuk replace kalimat yang kita dapatkan pada baris pertama dari head.

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

**SOAL 3** 
1 tahun telah berlalu sejak pencampakan hati Kusuma. Akankah sang pujaan hati kembali ke naungan Kusuma? Memang tiada maaf bagi Elen. Tapi apa daya hati yang sudah hancur, Kusuma masih terguncang akan sikap Elen. Melihat kesedihan Kusuma, kalian mencoba menghibur Kusuma dengan mengirimkan gambar kucing. 
[a] Maka dari itu, kalian mencoba membuat script untuk mendownload 28 gambar dari "https://loremflickr.com/320/240/cat" menggunakan command wget dan menyimpan file dengan nama "pdkt_kusuma_NO" (contoh: pdkt_kusuma_1, pdkt_kusuma_2, pdkt_kusuma_3) serta jangan lupa untuk menyimpan log messages wget kedalam sebuah file "wget.log". Karena kalian gak suka ribet, kalian membuat penjadwalan untuk menjalankan script download gambar tersebut. Namun, script download tersebut hanya berjalan
[b] setiap 8 jam dimulai dari jam 6.05 setiap hari kecuali hari Sabtu Karena gambar yang didownload dari link tersebut bersifat random, maka ada kemungkinan gambar yang terdownload itu identik. Supaya gambar yang identik tidak dikira Kusuma sebagai spam, maka diperlukan sebuah script untuk memindahkan salah satu gambar identik. Setelah memilah gambar yang identik, maka dihasilkan gambar yang berbeda antara satu dengan yang lain. Gambar yang berbeda tersebut, akan kalian kirim ke Kusuma supaya hatinya kembali ceria. Setelah semua gambar telah dikirim, kalian akan selalu menghibur Kusuma, jadi gambar yang telah terkirim tadi akan kalian simpan
kedalam folder /kenangan dan kalian bisa mendownload gambar baru lagi. 
[c] Maka dari itu buatlah sebuah script untuk mengidentifikasi gambar yang identik dari keseluruhan gambar yang terdownload tadi. Bila terindikasi sebagai gambar yang identik, maka sisakan 1 gambar dan pindahkan sisa file identik tersebut ke dalam folder ./duplicate
dengan format filename "duplicate_nomor" (contoh : duplicate_200, duplicate_201). Setelah itu lakukan pemindahan semua gambar yang tersisa kedalam folder ./kenangan dengan format filename "kenangan_nomor" (contoh: kenangan_252, kenangan_253).
Setelah tidak ada gambar di current directory, maka lakukan backup seluruh log menjadi ekstensi ".log.bak". Hint : Gunakan wget.log untuk membuat location.log yang isinya merupakan hasil dari grep "Location".
*Gunakan Bash, Awk dan Crontab
```
#!/bin/bash
counterken=0
counterdup=0
for (( i=1; i<=28; i++ ))
do
	wget "https://loremflickr.com/320/240/cat" -O /home/iqbaal/praktikum1/bulk_gambar/pdkt_kusuma_$i.jpg 2>&1 | tee >> /home/iqbaal/praktikum1/log/wget.log
	cat /home/iqbaal/praktikum1/log/wget.log | grep Location: | tail -1 | awk '{print $2}' >> /home/iqbaal/praktikum1/log/location.log
	counterken=$(ls /home/iqbaal/kenangan/ | awk -F "_" '{print $2}'| sort -n | tail -1 | awk -F "." '{print $1}')
	counterdup=$(ls /home/iqbaal/duplicate/ | awk -F "_" '{print $2}' | sort -n | tail -1 | awk -F "." '{print $1}')
	if [[ -z $counterken ]]
		then
		counterken=0
		mv /home/iqbaal/praktikum1/bulk_gambar/pdkt_kusuma_$i.jpg /home/iqbaal/kenangan/kenangan_1.jpg
	else
		loc=$(cat /home/iqbaal/praktikum1/log/location.log | awk '{print $0}' | tail -1)
		img_count=$(awk -v locate=$loc '{arr[$locate]++} END{print arr[$locate]}' /home/iqbaal/praktikum1/log/location.log)
			if [ $img_count -gt 1 ] 
				then
					if [[ -z $counterdup ]]
					then
						mv /home/iqbaal/praktikum1/bulk_gambar/pdkt_kusuma_$i.jpg /home/iqbaal/duplicate/duplicate_1.jpg
					else
						mv /home/iqbaal/praktikum1/bulk_gambar/pdkt_kusuma_$i.jpg /home/iqbaal/duplicate/duplicate_$(($counterdup+1)).jpg
					fi
			else
				mv /home/iqbaal/praktikum1/bulk_gambar/pdkt_kusuma_$i.jpg /home/iqbaal/kenangan/kenangan_$(($counterken+1)).jpg
			fi
	fi		
done
cat /home/iqbaal/praktikum1/log/wget.log > /home/iqbaal/praktikum1/log/wget.log.bak
```
```
for (( i=1; i<=28; i++ ))
do
	wget "https://loremflickr.com/320/240/cat" -O /home/iqbaal/praktikum1//bulk_gambar/pdkt_kusuma_$i.jpg 2>&1 | tee >> /home/iqbaal/prakt/bulk_gambar/pdkt_kusuma_$i.jpg 2>&1 | tee >> /home/iqbaal/praktikum1/log/wget.log
```
Pada code soal3.sh tersebut merupakan kode gabungan dari no 3a dan 3c dimana untuk mendownload dengan perulangan hingga 28 untuk mendownload 28 gambar sesuai soal menggunakan wget dan -O untuk meletakkan output file pada directory yang kita inginkan yaitu di folder bulk_gambar dan dengan nama `pdkt_kusuma_$i`, kemudian `2&>1` untuk mengexclude error dan tee untuk mendapatkan serta menuliskan messages log ke directory yang kita inginkan yaitu di folder log dengan nama `wget.log`
```
‘cat /home/iqbaal/praktikum1/log/wget.log | grep Location: | tail -1 | awk '{print $2}' >> /home/iqbaal/praktikum1/log/location.log’
```
Kemudian kita mencari Location dari hasil download yang paling baru dengan mengambilnya dari file` wget.log` dan dengan kata kunci `grep: Location` serta `tail -1` untuk mendapatkan Location dari hasil download yang paling baru. Kemudian hasil tersebut diletakkan ke file `location.log` yang ada di folder log juga. Disini kita menggunakan `> >` agar nantinya saat file ini sudah ada maka hasil output Location akan diappend.
```
counterken=$(ls /home/iqbaal/kenangan/ | awk -F "_" '{print $2}'| sort -n | tail -1 | awk -F "." '{print $1}')’
counterdup=$(ls /home/iqbaal/duplicate/ | awk -F "_" '{print $2}' | sort -n | tail -1 | awk -F "." '{print $1}')
```
Setelah itu kita mencari nomor file terakhir yang ada di folder kenangan dan duplicate dengan cara memunculkan list di seluruh folder kenangan dan duplicate. `awk -F "_" '{print $2}'` untuk memfilter nomer file dengan kata kenangan atau dupicate yang ada pada nama file. `Sort -n` dan `tail -1` digunakan untuk melakukan pengurutan nomor file dan mengambil nomor paling akhir/nomor paling besar. `awk -F "." '{print $1}')` digunakan untuk memisahkan nomor file dengan kata jpg yang ada pada nama file

  
```
if [[ -z $counterken ]]
then
counterken=0
mv /home/iqbaal/praktikum1/bulk_gambar/pdkt_kusuma_$i.jpg /home/iqbaal/kenangan/kenangan_1.jpg
```
  
Perintah diatas yaitu untuk mengecek apakah counterken yang sebelumnya dihitung ada atau tidak (di folder kenangan ada file atau tidak), jika iya maka nilai `counterken` diset 0 dan kemudian file yang baru didownload dipindah ke folder kenangan dengan nama `kenangan_1.jpg` karena merupakan file pertama yang ada di folder kenangan
  
```
else
	loc=$(cat /home/iqbaal/praktikum1/log/location.log | awk '{print $0}' | tail -1)
	img_count=$(awk -v locate=$loc '{arr[$locate]++} END{print arr[$locate]}' /home/iqbaal/praktikum1/log/location.log)
```
Jika di folder kenangan ternyata tidak kosong kita mendeklarasikan variabel `loc` yang akan berisi lokasi download paling baru yang ada di akhir file dengan menampilkan file di `location.log` kemudian `awk '{print $0}' | tail -1` untuk mencetak baris yang paling akhir. Kemudian dideklarasikan juga variabel `img_count` untuk menghitung jumlah gambar sama yang sudah didownload dengan cara `awk -v locate=$loc {arr[$locate]++}`, yaitu hasil dari variabel loc dipassing kemudian kita melakukan penambahan 1 untuk setiap array indeks locate untuk menunjukkan setiap locate download sudah muncul berapa kali di file `location.log`. Kemudian dicetak isi dari array dengan indeks file download yang sedang dibandingkan.
```
if [ $img_count -gt 1 ]
then
	if [[ -z $counterdup ]]
		then
		mv /home/iqbaal/praktikum1/bulk_gambar/pdkt_kusuma_$i.jpg 	/home/iqbaal/duplicate/duplicate_1.jpg
	else
		mv /home/iqbaal/praktikum1/bulk_gambar/pdkt_kusuma_$i.jpg /home/iqbaal/duplicate/duplicate_$(($counterdup+1)).jpg
	fi
else
	mv /home/iqbaal/praktikum1/bulk_gambar/pdkt_kusuma_$i.jpg /home/iqbaal/kenangan/kenangan_$(($counterken+1)).jpg
fi
```
 Di kode tersebut dicek kembali jika variabel `img_count` lebih besar dari 1 atau tidak, jika ternyata lebih besar dari 1 atau file tersebut sudah pernah didownload maka dipindahkan ke folder duplicate namun sebelum itu dicek juga `if [[ -z $counterdup ]]` untuk mengecek kondisi apakah di file duplicate sudah ada file atau belum. Jika ternyata tidak ada maka file yang didownload tersebut dipindahkan ke folder duplicate dengan nama file `duplicate_1.jpg` karena merupakan file pertama di folder duplicate. Jika ternyata sudah ada file di folder duplicate maka file diberi nama duplicate dengan indeks hasil dari `counterdup+1`. Setelah itu jika ternyata `img_count` sama dengan 1 maka file yang baru didownload langsung dipindah ke folder kenangan dengan nama file kenangan dan indeksnya menggunakan `counterken+1`.
 ```
done
cat /home/iqbaal/praktikum1/log/wget.log > /home/iqbaal/praktikum1/log/wget.log.bak
```
Setelah download selesai maka kita menyalin yang ada di file `wget.log` ke file `wget.log.bak`

Sedangkan kode untuk crontab atau soal no 3b 
`05 06-23/8 * * 0-5 bash /home/iqbaal/praktikum1/3`
Dimana menunjukkan saat jam 06.05 dan kemudian setiap 8 jam (ditunjukkan dengan `/8`) serta hari Minggu hingga Jumat (ditunjukkan dengan `0-5`) dijalankan program bash di folder tersebut
