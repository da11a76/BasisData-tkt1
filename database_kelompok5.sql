CREATE TABLE BpsPusat(
	kodeSakernas VARCHAR(45) PRIMARY KEY,
	idPusat INTEGER NOT NULL,
	alamatKantor VARCHAR(50) NOT NULL,
	nomorTelepon VARCHAR(13) NOT NULL
	);
CREATE TABLE BpsProvinsi(
	kodeProv CHAR(2) PRIMARY KEY,
	namaProv VARCHAR(20) NOT NULL,
	kodeSakernas VARCHAR(45) NOT NULL,
	FOREIGN KEY(kodeSakernas) REFERENCES BpsPusat(kodeSakernas) 
		ON UPDATE CASCADE
		ON DELETE CASCADE
	);
CREATE TABLE BpsKab_Kota(
	kodeKab_Kota CHAR(9),
	kodeProv CHAR(2),
	namaKab_Kota VARCHAR(20) NOT NULL,
	PRIMARY KEY(kodeKab_Kota, kodeProv),
	FOREIGN KEY(kodeProv) REFERENCES BpsProvinsi(kodeProv)
		ON UPDATE CASCADE
		ON DELETE CASCADE
	);
CREATE TABLE sls (
	kode_ketua_sls CHAR(10) PRIMARY KEY,
	nama_ketua_sls VARCHAR(100) NOT NULL
	);
CREATE TABLE kortek_zonaMerah (
	kodeKortek VARCHAR(10) ,
	kodeProv CHAR(2),
	kodeKab_Kota CHAR(9),
	kode_ketua_sls CHAR(10) NOT NULL,
	namaKortek VARCHAR(10) NOT NULL,
	PRIMARY KEY(kodeKortek, kodeKab_Kota, kodeProv),
	FOREIGN KEY(kodeKab_Kota, kodeProv) REFERENCES BpsKab_Kota(kodeKab_Kota, kodeProv)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY(kode_ketua_sls) REFERENCES sls(kode_ketua_sls)
		ON UPDATE CASCADE
		ON DELETE NO ACTION
	);
CREATE TABLE PML(
	kode_pengawas VARCHAR(10),
	kodeKab_Kota CHAR(9),
	kodeProv CHAR(2),
	nama_pengawas VARCHAR(10) NOT NULL,
	nomor_ketua_sls CHAR(10) NOT NULL,
	PRIMARY KEY(kode_pengawas, kodeKab_Kota, kodeProv),
	FOREIGN KEY(kodeKab_Kota, kodeProv) REFERENCES BpsKab_Kota(kodeKab_Kota, kodeProv)
		ON UPDATE CASCADE
		ON DELETE CASCADE
	);
CREATE TABLE blokSensus(
	kodeBlokSensus CHAR(10),
	kodeKab_Kota CHAR(9),
	kodeProv CHAR(2),
	kode_pengawas VARCHAR(10),
	kodeKortek VARCHAR(10),
	namaDesa_Kelurahan VARCHAR(30) NOT NULL,
	PRIMARY KEY(kodeBlokSensus, kodeKab_Kota, kodeProv),
	FOREIGN KEY(kodeKab_Kota, kodeProv) REFERENCES BpsKab_Kota(kodeKab_Kota, kodeProv)
		ON UPDATE CASCADE
		ON DELETE SET NULL,
	FOREIGN KEY(kode_pengawas, kodeKab_Kota, kodeProv) REFERENCES PML(kode_pengawas, kodeKab_Kota, kodeProv)
		ON UPDATE CASCADE
		ON DELETE SET NULL,
	FOREIGN KEY(kodeKortek, kodeKab_Kota, kodeProv) REFERENCES kortek_zonaMerah(kodeKortek, kodeKab_Kota, kodeProv)
		ON UPDATE CASCADE
		ON DELETE SET NULL
	);
CREATE TABLE PCL(
	kodePencacah VARCHAR(10),
	kode_pengawas VARCHAR(10),
	namaPencacah VARCHAR(100)NOT NULL,
	noUrut_responden VARCHAR(12)NOT NULL,
	kodeKab_Kota CHAR(9),
	kodeProv CHAR(2),
	PRIMARY KEY(kodePencacah, kode_pengawas, kodeKab_Kota, kodeProv),
	FOREIGN KEY(kode_pengawas, kodeKab_Kota, kodeProv) REFERENCES PML(kode_pengawas, kodeKab_Kota, kodeProv)
		ON UPDATE CASCADE
		ON DELETE NO ACTION
	);
CREATE TABLE Responden(
	kodeNoUrutResponden VARCHAR(12),
	kodeBlokSensus CHAR(10),
	kodeKab_Kota CHAR(9),
	kodeProv CHAR(2),
	kodePencacah VARCHAR(10),
	kode_pengawas VARCHAR(10),
	kodeKortek VARCHAR(10),
	kodeNoUrutRTS VARCHAR(12) NOT NULL,
	PRIMARY KEY(kodeNoUrutResponden, kodeBlokSensus, kodeKab_Kota, kodeProv),
	FOREIGN KEY(kodeKortek, kodeKab_Kota, kodeProv) REFERENCES kortek_zonaMerah(kodeKortek, kodeKab_Kota, kodeProv)
		ON UPDATE CASCADE
		ON DELETE NO ACTION,
	FOREIGN KEY(kodePencacah, kode_pengawas, kodeKab_Kota, kodeProv) REFERENCES PCL(kodePencacah, kode_pengawas, kodeKab_Kota, kodeProv)
		ON UPDATE CASCADE
		ON DELETE NO ACTION,
	FOREIGN KEY(kodeBlokSensus, kodeKab_Kota, kodeProv) REFERENCES blokSensus(kodeBlokSensus, kodeKab_Kota, kodeProv)
		ON UPDATE CASCADE
		ON DELETE NO ACTION
	);
	
	
	
	
	
	
	
	
	
	
	
	
