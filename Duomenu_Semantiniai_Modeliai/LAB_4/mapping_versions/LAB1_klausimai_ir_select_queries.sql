-- 1. Kiek gyvûnø, kuriu rûðis nëra ðuo, turi kiekviena prieglauda?

SELECT
	p.[pavadinimas] AS [prieglaudos_pavadinimas]
	,COUNT(DISTINCT g.[id_Gyvunas]) AS [gyvunu_kurie_nera_sunys_kiekis]
FROM [dbo].[PRIEGLAUDA] p
JOIN [dbo].[GYVUNAS] g
	ON g.[fk_PRIEGLAUDAid_NAUDOTOJAS] = p.[id_NAUDOTOJAS]
WHERE
	g.[rusis] NOT LIKE 'suo'
GROUP BY
	p.[pavadinimas]
ORDER BY 
	[Gyvunu_kurie_nera_sunys_kiekis] DESC

-- 2. Kurios dvi prieglaudos turi daugiausiai gyvûnø, kuriø apraðymuose paminëti þodþiai mielas(-a), meilus(-i) arba draugiðkas(-a)?

SELECT TOP(2)
	p.[pavadinimas] AS [prieglaudos_pavadinimas]
	,COUNT(DISTINCT g.[id_GYVUNAS]) AS [gyvunu_apibudintu_kaip_draugiski_skaicius]
FROM [dbo].[GYVUNAS] g
JOIN [dbo].[APRASYMAS] a
	ON a.[fk_GYVUNASid_GYVUNAS] = g.[id_GYVUNAS]
JOIN [dbo].[PRIEGLAUDA] p
	ON p.[id_NAUDOTOJAS] = g.[fk_PRIEGLAUDAid_NAUDOTOJAS]
WHERE
	a.[tekstas] LIKE '%draug%'
	OR a.[tekstas] LIKE '%meil%'
	OR a.[tekstas] LIKE '%miel%'
GROUP BY
	p.[pavadinimas]
ORDER BY
	[gyvunu_apibudintu_kaip_draugiski_skaicius] DESC

-- 3. Su kuriais gyvûnais prieglaudose nebuvo surengti susitikimai?

SELECT
	p.[pavadinimas] AS [prieglaudos_pavadinimas]
	,g.*
FROM [dbo].[GYVUNAS] g
JOIN [dbo].[PRIEGLAUDA] p
	ON p.[id_NAUDOTOJAS] = g.[fk_PRIEGLAUDAid_NAUDOTOJAS]
WHERE
	g.[id_GYVUNAS] NOT IN
	(
		SELECT
			s.[fk_GYVUNASid_GYVUNAS]
		FROM [dbo].[SUSITIKIMAS] s
	)
ORDER BY 
	g.[id_GYVUNAS]

-- 4. Kuriø asmenø praðymai priglausti gyvûnà buvo atmesti dël asmens patikrinimo nepraëjimo? Dël kokiø prieþasèiø patikrinimas buvo nepraeitas?

SELECT
	a.*
	,ap.[aprasymas] AS [patikrinimo_nepraejimo_priezastis]
FROM [dbo].[PRASYMAS] p
JOIN [dbo].[DOKUMENTAS] d
	ON d.[id_DOKUMENTAS] = p.[id_DOKUMENTAS]
JOIN [dbo].[ASMENS_PATIKRINIMAS] ap
	ON ap.[fk_ASMUOid_NAUDOTOJAS] = d.[fk_ASMUOid_NAUDOTOJAS]
JOIN [dbo].[ASMUO] a
	ON a.[id_NAUDOTOJAS] = ap.[fk_ASMUOid_NAUDOTOJAS]
WHERE
	p.[busena] = 'atmestas'
	AND ap.[tinkamumas] = 0
	AND ap.[data] >= d.[sukurimo_data]

-- 5. Kurie asmenys po susitikimo uþpildë praðymà, o uþpildæ praðymà po to pasiraðë gyvûno priglaudimo sutartá?

SELECT * 
FROM [dbo].[ASMUO] a
WHERE
	a.[id_NAUDOTOJAS] IN
	(
		SELECT s.[fk_ASMUOid_NAUDOTOJAS]
		FROM [dbo].[SUSITIKIMAS] s
		INNER JOIN [dbo].[DOKUMENTAS] d1
			ON d1.[fk_ASMUOid_NAUDOTOJAS] = s.[fk_ASMUOid_NAUDOTOJAS]
		INNER JOIN [dbo].[DOKUMENTAS] d2
			ON d2.[fk_ASMUOid_NAUDOTOJAS] = s.[fk_ASMUOid_NAUDOTOJAS]
		INNER JOIN [dbo].[PRASYMAS] p
			ON p.[id_DOKUMENTAS] = d1.[id_DOKUMENTAS]
		INNER JOIN [dbo].[SUTARTIS] st
			ON st.[id_DOKUMENTAS] = d2.[id_DOKUMENTAS]
		WHERE
			d1.[dokumento_tipas] = 'prasymas'
			AND d2.[dokumento_tipas] = 'sutartis'
			AND d1.[sukurimo_data] >= s.[susitikimo_data]
			AND d2.[sukurimo_data] >= s.[susitikimo_data]
			AND st.[pasirasymo_data] >= d1.[sukurimo_data]
			AND p.[busena] = 'patvirtintas'
			AND st.[busena] = 'patvirtintas'
	)
ORDER BY
	a.[vardas] ASC
	,a.[pavarde] ASC