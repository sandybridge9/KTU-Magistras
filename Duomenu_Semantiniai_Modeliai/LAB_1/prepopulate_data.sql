DELETE FROM [dbo].[NAUDOTOJAS]

INSERT INTO [dbo].[NAUDOTOJAS]
	([adresas], [elektroninis_pastas], [telefono_numeris], [registracijos_data], [naudotojo_tipas], [id_NAUDOTOJAS])
VALUES
	--Prieglaudos
	 ('Vasario 16-osios g. 15, Kaunas', 'nuaras@gmail.com',		'+37054196854', '2021-04-07', 'prieglauda', 1)
	,('Matulio g. 47, Vilnius',			'penktakoja@gmail.com', '+37076785677',	'2022-09-09', 'prieglauda', 2)
	,('J.Basanaviciaus g. 33, Kaunas',	'katinukas@gmail.com',	'+37078567878', '2024-03-01', 'prieglauda', 3)
	,('Jonavos g. 231, Kaunas',			'sleptuve@gmail.com',	'+37023477852', '2023-05-07', 'prieglauda', 4)
	,('Arbatos g. 11, Vilnius',			'rainiukai@gmail.com',	'+37231545345', '2022-10-01', 'prieglauda', 5)
	--Asmenys
	,('Sarkos g. 22, Kaunas',			'jonas.stul41@gmail.com',	'+37054196854', '2024-01-11', 'asmuo', 6)
	,('Kipro g. 47, Vilnius',			'mantasbut7@gmail.com',		'+37076785677',	'2024-01-18', 'asmuo', 7)
	,('Miesto g. 142, Vilnius',			'kevinaskevin01@gmail.com',	'+37054535464', '2024-02-01', 'asmuo', 8)
	,('Liepu g. 33, Kaunas',			'askagialgis5@gmail.com',	'+37078567878', '2024-02-13', 'asmuo', 9)
	,('Vilniaus g. 231, Kaunas',		'marmurmantas600@gmail.com','+37023477852', '2024-03-15', 'asmuo', 10)


DELETE FROM [dbo].[PRIEGLAUDA]

INSERT INTO [dbo].[PRIEGLAUDA]
	([pavadinimas], [imones_kodas], [id_Naudotojas])
VALUES
	 ('Nuaras',				'LT15848', 1)
	,('Penkta koja',		'LT45644', 2)
	,('Katinuko namai',		'LT78321', 3)
	,('Gyvunu sleptuve',	'LT12547', 4)
	,('Rainiukai',			'LT78989', 5)

DELETE FROM [dbo].[ASMUO]

INSERT INTO [dbo].[ASMUO]
	([vardas], [pavarde], [gimimo_data], [asmens_kodas], [id_NAUDOTOJAS])
VALUES
	 ('Jonas',		'Stulginskis',		'1997-02-02',	'47852214856',	6)
	,('Mantas',		'Butautas',			'2007-02-22',	'47854156456',	7)
	,('Kevinas',	'Kevalaitis',		'1991-07-02',	'47852214856',	8)
	,('Algis',		'Askanius',			'1952-02-12',	'47877777777',	9)
	,('Mantas',		'Murmantas',		'2003-06-02',	'47669665856',	10)

DELETE FROM [dbo].[GYVUNAS]

INSERT INTO [dbo].[GYVUNAS]
	([vardas], [veisle], [gimimo_data], [rusis], [gyvno_dydzio_kategorija], [id_GYVUNAS], [fk_PRIEGLAUDAid_NAUDOTOJAS])
VALUES
	--Nuaras gyvunai
	 ('Amsius',		NULL,			'2022-02-02', 'suo',			'XL',	1,	1)
	,('Blizgis',	'Chihuahua',	'2021-02-22', 'suo',			'S',	2,	1)
	,('Mikas',		'Buldogas',		'2020-07-02', 'suo',			'L',	3,	1)
	--Penkta koja gyvunai
	,('Binkis',		'Dobermanas',	'2019-07-02', 'suo',			'XL',	4,	2)
	,('Kudlius',	'Degutis',		'2018-02-12', 'grauzikas',		'S',	5,	2)
	,('Smiltis',	'Papuga',		'2017-06-02', 'paukstis',		'S',	6,	2)
	--Katinuko namai gyvunai
	,('Spaikas',	NULL,			'2016-02-02', 'kate',			'M',	7,	3)
	,('Puikis',		NULL,			'2018-02-22', 'kate',			'M',	8,	3)
	,('Milkis',		'Abisinija',	'2020-07-02', 'kate',			'L',	9,	3)
	--Gyvunu sleptuve gyvunai
	,('Freda',		'Driezas',		'2021-02-02', 'roplys',			'M',	10, 4)
	,('Klaja',		'Ziurkenas',	'2022-07-02', 'grauzikas',		'S',	11, 4)
	,('Strakse',	'Varle',		'2020-06-02', 'varliagyvis',	'S',	12, 4)
	--Rainiukai gyvunai
	,('Bukis',		'Nulepause',	'2017-02-02', 'kate',			'S',	13, 5)
	,('Nima',		'Melynoji',		'2022-02-22', 'kate',			'S',	14, 5)
	,('Santa',		'Baltoji',		'2021-07-02', 'kate',			'M',	15, 5)

DELETE FROM [dbo].[APRASYMAS]

INSERT INTO [dbo].[APRASYMAS]
	([tekstas], [id_APRASYMAS], [fk_GYVUNASid_GYVUNAS])
VALUES
	 ('Labai saugantis suniukas ieskantis namu.',									1, 1)
	,('Griezto charakterio suniukas iesko seimininko.',								2, 2)
	,('Labai draugiskas ir svelnus buldogas iesko siltu namu.',						3, 3)
	,('Draugiskas ir meilus suniukas iesko mylincios seimos.',						4, 4)
	,('Mazasis padukelis su daug energijos iesko seimininko.',						5, 5)
	,('Draugiskas giesmininkas iesko nauju namu.',									6, 6)
	,('Meili ir draugiska katyte iesko nauju namu.',								7, 7)
	,('Su dideliu charakteriu katinas iesko iskilmingu seimininku.',				8, 8)
	,('Mazasis medziotojas su draugisku charackteriu iesko nauju namu.',			9, 9)
	,('Ieskomi namai viska valganciam driezui.',									10, 10)
	,('Mazasis ziurkenas iesko kitos vietos savo narveliui.',						11, 11)
	,('Muses valganti draugiska varle iesko varliagyvius megstanciu zmoniu.',		12, 12)
	,('Nulepause miela katyte iesko siltu namu.',									13, 13)
	,('Isdidinga ir charakteri turinti medziotoja iesko supratingo seimininko.',	14, 14)
	,('Mazoji kaledu senelio padejeja iesko namu.',									15, 15)

DELETE FROM [dbo].[ASMENS_PATIKRINIMAS]

INSERT INTO [dbo].[ASMENS_PATIKRINIMAS]
	([data], [tinkamumas], [aprasymas], [id_ASMENS_PATIKRINIMAS], [fk_ASMUOid_NAUDOTOJAS], [fk_PRIEGLAUDAid_NAUDOTOJAS])
VALUES
	  ('2024-03-10', 1, 'Asmuo tinkantis gyvunu priglaudimui.',																	1, 6,  2)
	 ,('2024-03-28', 0, 'Asmuo netinkantis gyvunu priglaudimui. Asmuo dar nesulaukes pilnametystes.',							2, 7,  1)
	 ,('2024-03-12', 1, 'Asmuo tinkantis gyvunu priglaudimui.',																	3, 8,  3)
	 ,('2024-03-28', 0, 'Asmuo netinkantis gyvunu priglaudimui. Asmuo yra padares nusizengimu ar nusikaltimu pries gyvunus.',	4, 9,  5)
	 ,('2024-03-14', 1, 'Asmuo tinkantis gyvunu priglaudimui.',																	5, 10, 4)

DELETE FROM [dbo].[SUSITIKIMAS]

INSERT INTO [dbo].[SUSITIKIMAS]
	([sukurimo_data], [susitikimo_data], [id_SUSITIKIMAS], [fk_ASMUOid_NAUDOTOJAS], [fk_PRIEGLAUDAid_NAUDOTOJAS], [fk_GYVUNASid_GYVUNAS])
VALUES
	 ('2024-03-10', '2024-03-18', 1,  6,  3, 8)
	,('2024-03-10', '2024-03-18', 2,  6,  3, 9)
	,('2024-03-10', '2024-03-18', 3,  6,  5, 14)
	,('2024-03-10', '2024-03-18', 4,  6,  5, 15)
	,('2024-03-10', '2024-03-18', 5,  8,  1, 1)
	,('2024-03-10', '2024-03-18', 6,  8,  1, 2)
	,('2024-03-10', '2024-03-18', 7,  8,  1, 3)
	,('2024-03-10', '2024-03-18', 8,  8,  2, 4)
	,('2024-03-10', '2024-03-18', 9,  10, 4, 10)
	,('2024-03-10', '2024-03-18', 10, 10, 4, 12)

DELETE FROM [dbo].[DOKUMENTAS]

INSERT INTO [dbo].[DOKUMENTAS]
	([sukurimo_data], [tekstas], [dokumento_tipas], [id_DOKUMENTAS], [fk_GYVUNASid_GYVUNAS], [fk_PRIEGLAUDAid_NAUDOTOJAS], [fk_ASMUOid_NAUDOTOJAS])
VALUES
	 ('2024-03-19', 'Prasymas priimti gyvuna globai.',	'prasymas',		1, 8,  3, 6)
	,('2024-03-20', 'Gyvuno globos sutartis.',			'sutartis',		2, 8,  3, 6)
	,('2024-03-19', 'Prasymas priimti gyvuna globai.',	'prasymas',		3, 12, 4, 10)
	,('2024-03-20', 'Gyvuno globos sutartis.',			'sutartis',		4, 12, 4, 10)
	,('2024-03-28', 'Gyvuno grazinimas.',				'grazinimas',	5, 12, 4, 10)
	,('2024-03-28', 'Prasymas priimti gyvuna globai.',	'prasymas',		6, 3,  1, 7)
	,('2024-03-28', 'Prasymas priimti gyvuna globai.',	'prasymas',		7, 15, 5, 9)

DELETE FROM [dbo].[PRASYMAS]

INSERT INTO [dbo].[PRASYMAS]
	([busena], [id_DOKUMENTAS])
VALUES
	 ('patvirtintas',	1)
	,('patvirtintas',	3)
	,('atmestas',		6)
	,('atmestas',		7)

DELETE FROM [dbo].[SUTARTIS]

INSERT INTO [dbo].[SUTARTIS]
	([pasirasymo_data], [busena], [id_DOKUMENTAS])
VALUES
	 ('2024-03-20', 'patvirtintas', 2)
	,('2024-03-20', 'patvirtintas', 4)

DELETE FROM [dbo].[GRAZINIMAS]

INSERT INTO [dbo].[GRAZINIMAS]
	([grazinimo_data], [id_DOKUMENTAS])
VALUES
	 ('2024-03-28', 1)