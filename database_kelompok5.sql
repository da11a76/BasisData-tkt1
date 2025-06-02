CREATE TABLE BpsPusat(
	kodeSakernas VARCHAR(45) PRIMARY KEY,
	idPusat INTEGER NOT NULL,
	alamatKantor VARCHAR(50) NOT NULL,
	nomorTelepon VARCHAR(13) NOT NULL,
	);
CREATE TABLE BpsProvinsi(
	kodeProv CHAR(2) PRIMARY KEY,
	namaProv VARCHAR(20) NOT NULL,
	kodeSakernas VARCHAR(45) NOT NULL,
	FOREIGN KEY(kodeSakernas) REFERENCES BpsPusat(kodeSakernas) ON UPDATE CASCADE
	);
CREATE TABLE BpsKab_Kota(
	kodeKab/Kota CHAR(9),
	kodeProv CHAR(2),
	namaKab/Kota VARCHAR(20) NOT NULL,
	kode_pengawas VARCHAR(10) NOT NULL,
	PRIMARY KEY(kodeKab_Kota, kodeProv),
	FOREIGN KEY(kodeProv) REFERENCES BpsProvinsi(kodeProv)ON UPDATE CASCADE
	);
CREATE TABLE sls (
	kode_ketua_sls CHAR(10) PRIMARY KEY,
	nama_ketua_sls VARCHAR(100) NOT NULL
	);
CREATE TABLE kortek_zonaMerah (
	kodeKortek VARCHAR(10) ,
	kodeKab_Kota CHAR(9),
	kode_ketua_sls CHAR(10) NOT NULL,
	namaKortek VARCHAR(10) NOT NULL,
	PRIMARY KEY(kodeKortek, kodeKab_Kota)
	FOREIGN KEY(kodeKab/Kota) REFERENCES BpsKab_Kota(kodeKab_Kota)ON UPDATE CASCADE,
	FOREIGN KEY(kode_ketua_sls) REFERENCES sls(kode_ketua_sls)ON UPDATE CASCADE
	);
CREATE TABLE PML(
	kode_pengawas VARCHAR(10),
	kodeKab_Kota CHAR(9),
	nama_pengawas VARCHAR(10) NOT NULL,
	nomor_ketua_sls CHAR(10) NOT NULL
	PRIMARY KEY(kode_pengawas, kodeKab_Kota)ON UPDATE CASCADE,
	FOREIGN KEY(kodeKab_Kota) REFERENCES BpsKab_Kota(kodeKab_Kota)ON UPDATE CASCADE
	);
CREATE TABLE blokSensus(
	kodeBlokSensus CHAR(10),
	kodeKab_Kota CHAR(9),
	kode_pengawas VARCHAR(10),
	kodeKortek VARCHAR(10),
	namaDesa/Kelurahan VARCHAR(30) NOT NULL,
	PRIMARY KEY(kodeBlokSensus, kodeKab_Kota),
	FOREIGN KEY(kodeKab_Kota) REFERENCES BpsKab/Kota(kodeKab_Kota)ON UPDATE CASCADE,
	FOREIGN KEY(kode_pengawas) REFERENCES PML(kode_pengawas)ON UPDATE CASCADE,
	FOREIGN KEY(kodeKortek) REFERENCES kortek_zonaMerah(kodeKortek)ON UPDATE CASCADE
	);
CREATE TABLE kortekPCL(
	kodeKortek VARCHAR(10),
	kode_pencacahKortek VARCHAR(10),
	PRIMARY KEY(kodeKortek, kode_pencacahKortek),
	FOREIGN KEY(kodeKortek) REFERENCES kortek_zonaMerah(kodeKortek)ON UPDATE CASCADE
	);
CREATE TABLE PCL(
	kodePencacah VARCHAR(10),
	kode_pengawas VARCHAR(10),
	namaPencacah VARCHAR(100)NOT NULL,
	noUrut_responden VARCHAR(12)NOT NULL,
	PRIMARY KEY(kodePencacah, kode_pengawas),
	FOREIGN KEY(kode_pengawas) REFERENCES PML(kode_pengawas)ON UPDATE CASCADE
	);
CREATE TABLE Responden(
	kodeNoUrutResponden VARCHAR(12),
	kodeBlokSensus CHAR(10),
	kodePencacah VARCHAR(10),
	kode_pencacahKortek VARCHAR(10),
	kodeNoUrutRTS VARCHAR(12) NOT NULL,
	PRIMARY KEY(kodeNoUrutResponden, kodeBlokSensus),
	FOREIGN KEY(kode_pencacahKortek) REFERENCES kortekPCL(kode_pencacahKortek)ON UPDATE CASCADE,
	FOREIGN KEY(kodePencacah) REFERENCES PCL(kodePencacah)ON UPDATE CASCADE
	);
	
	
	
	
	
	
	
	
	
	
	
	
