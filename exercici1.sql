SELECT nombre FROM tienda.producto;
SELECT nombre, precio FROM tienda.producto;
SELECT * FROM tienda.producto;
SELECT nombre, precio, precio*1.05 FROM tienda.producto;
SELECT nombre, precio AS euros, precio * 1.05 AS dollars FROM tienda.producto;
SELECT UPPER(nombre), precio FROM tienda.producto;
SELECT LOWER(nombre), precio FROM tienda.producto;
SELECT nombre, UPPER(LEFT(nombre, 2)) AS Iniciales FROM tienda.fabricante;
SELECT nombre, Round(precio) FROM tienda.producto;
SELECT nombre, truncate(precio,0) FROM tienda.producto;
SELECT codigo_fabricante FROM tienda.producto;
SELECT DISTINCT codigo_fabricante FROM tienda.producto;
SELECT nombre FROM tienda.fabricante ORDER BY nombre;
SELECT nombre FROM tienda.fabricante ORDER BY nombre DESC;
SELECT nombre FROM tienda.producto ORDER BY nombre, precio DESC;
SELECT * from tienda.fabricante LIMIT 5;
SELECT * from tienda.fabricante LIMIT 3,2;
SELECT nombre, precio from tienda.producto  ORDER BY precio asc LIMIT 1;
SELECT nombre, precio from tienda.producto  ORDER BY precio desc LIMIT 1;
SELECT nombre FROM tienda.producto WHERE codigo_fabricante = 2;
SELECT producto.nombre, precio, fabricante.nombre  
	FROM tienda.producto join tienda.fabricante 
	ON tienda.producto.codigo_fabricante = tienda.fabricante.codigo;
-- 22
SELECT producto.nombre, precio, fabricante.nombre
	FROM tienda.producto JOIN tienda.fabricante
    ON tienda.producto.codigo_fabricante = tienda.fabricante.codigo
    ORDER BY tienda.fabricante.nombre;
-- 23
SELECT producto.codigo AS codigo_producto, producto.nombre, precio, fabricante.codigo AS codigo_fabricante, fabricante.nombre
	FROM tienda.producto JOIN tienda.fabricante
    ON tienda.producto.codigo_fabricante = tienda.fabricante.codigo
    ORDER BY producto.codigo;
-- 24
SELECT producto.nombre, precio, fabricante.nombre
	FROM tienda.producto JOIN tienda.fabricante
    ON tienda.producto.codigo_fabricante = tienda.fabricante.codigo
    ORDER BY producto.precio LIMIT 1;
-- 25
SELECT producto.nombre, precio, fabricante.nombre
	FROM tienda.producto JOIN tienda.fabricante
    ON tienda.producto.codigo_fabricante = tienda.fabricante.codigo
    ORDER BY producto.precio DESC LIMIT 1;
-- 26
SELECT producto.nombre
	FROM tienda.producto JOIN tienda.fabricante
    ON tienda.producto.codigo_fabricante = tienda.fabricante.codigo
    WHERE fabricante.nombre="Lenovo";
-- 27
SELECT producto.nombre
	FROM tienda.producto JOIN tienda.fabricante
    ON tienda.producto.codigo_fabricante = tienda.fabricante.codigo
    WHERE fabricante.nombre="Crucial" AND precio>200;
-- 28
SELECT producto.nombre
	FROM tienda.producto JOIN tienda.fabricante
    ON tienda.producto.codigo_fabricante = tienda.fabricante.codigo
    WHERE fabricante.nombre="Asus" OR fabricante.nombre="Hewlett-Packardy" OR fabricante.nombre="Seagate";
-- 29
SELECT producto.nombre
	FROM tienda.producto JOIN tienda.fabricante
    ON tienda.producto.codigo_fabricante = tienda.fabricante.codigo
    WHERE fabricante.nombre IN ("Asus","Hewlett-Packardy","Seagate");
-- 30
SELECT producto.nombre, precio
	FROM tienda.producto JOIN tienda.fabricante
    ON tienda.producto.codigo_fabricante = tienda.fabricante.codigo
    WHERE fabricante.nombre LIKE "%e";
-- 31
SELECT producto.nombre, precio
	FROM tienda.producto JOIN tienda.fabricante
    ON tienda.producto.codigo_fabricante = tienda.fabricante.codigo
    WHERE fabricante.nombre LIKE "%w%";
-- 32
SELECT producto.nombre, precio, fabricante.nombre
	FROM tienda.producto JOIN tienda.fabricante
    ON tienda.producto.codigo_fabricante = tienda.fabricante.codigo
    WHERE precio>=180 ORDER BY precio DESC, producto.nombre ASC;
-- 33
SELECT distinct fabricante.codigo, fabricante.nombre
	FROM tienda.producto JOIN tienda.fabricante
    ON tienda.producto.codigo_fabricante = tienda.fabricante.codigo;
-- 34
SELECT fabricante.nombre, producto.nombre
	FROM tienda.fabricante LEFT JOIN tienda.producto
    ON tienda.producto.codigo_fabricante = tienda.fabricante.codigo;
-- 35
SELECT fabricante.nombre, producto.nombre
	FROM tienda.fabricante LEFT JOIN tienda.producto
    ON tienda.producto.codigo_fabricante = tienda.fabricante.codigo
    WHERE producto.nombre IS NULL;
-- 36
SELECT fabricante.nombre, producto.nombre
	FROM tienda.fabricante,tienda.producto
    WHERE tienda.producto.codigo_fabricante = tienda.fabricante.codigo 
    AND fabricante.nombre = "Lenovo";
-- 37 
SELECT fabricante.nombre, producto.*
	FROM tienda.fabricante,tienda.producto
	WHERE tienda.producto.codigo_fabricante = tienda.fabricante.codigo 
	AND precio = (SELECT precio
		FROM tienda.fabricante,tienda.producto
		WHERE tienda.producto.codigo_fabricante = tienda.fabricante.codigo 
		AND fabricante.nombre = "Lenovo" ORDER BY producto.precio DESC LIMIT 1);
SELECT fabricante.nombre, producto.*
	FROM tienda.fabricante,tienda.producto
	WHERE tienda.producto.codigo_fabricante = tienda.fabricante.codigo 
	AND precio = (SELECT MAX(precio)
		FROM tienda.fabricante,tienda.producto
		WHERE tienda.producto.codigo_fabricante = tienda.fabricante.codigo 
		AND fabricante.nombre = "Lenovo");

-- 38

SELECT fab.nombre, pro.nombre, pro.precio
FROM (SELECT MAX(precio) maxprecio 
		FROM tienda.producto p JOIN tienda.fabricante f
		ON p.codigo_fabricante = f.codigo 
        WHERE f.nombre = "Lenovo" ) subtabla JOIN tienda.producto pro
        ON subtabla.maxprecio = pro.precio
        JOIN tienda.fabricante fab
        ON pro.codigo_fabricante = fab.codigo 
WHERE fab.nombre = "Lenovo";
        
-- 39
SELECT fab.nombre, pro.nombre, pro.precio
FROM (SELECT MIN(precio) maxprecio 
		FROM tienda.producto p JOIN tienda.fabricante f
		ON p.codigo_fabricante = f.codigo 
        WHERE f.nombre = "Hewlett-Packard" ) subtabla JOIN tienda.producto pro
        ON subtabla.maxprecio = pro.precio
        JOIN tienda.fabricante fab
        ON pro.codigo_fabricante = fab.codigo 
WHERE fab.nombre = "Hewlett-Packard";

-- 40 
SELECT producto.nombre
FROM tienda.producto
WHERE precio >= (
	SELECT MAX(precio)
	FROM tienda.producto p JOIN tienda.fabricante f
	ON p.codigo_fabricante = f.codigo 
	GROUP BY f.nombre
	HAVING f.nombre = "lenovo");

-- 41
SELECT pro.nombre
FROM tienda.producto pro JOIN tienda.fabricante fab
ON pro.codigo_fabricante = fab.codigo
WHERE fab.nombre= "Asus"
AND precio >(
	SELECT AVG(precio)
	FROM tienda.producto p JOIN tienda.fabricante f
	ON p.codigo_fabricante = f.codigo 
	GROUP BY f.nombre
	HAVING f.nombre = "Asus");
 
-- UNIVERSIDAD
-- 1
 SELECT DISTINCT apellido1, apellido2, per.nombre
 FROM universidad.persona per JOIN universidad.alumno_se_matricula_asignatura mat
 ON per.id=mat.id_alumno
 ORDER BY apellido1, apellido2, per.nombre;
 
 -- 2
SELECT DISTINCT apellido1, apellido2, per.nombre
 FROM universidad.persona per JOIN universidad.alumno_se_matricula_asignatura mat
 ON per.id=mat.id_alumno
 WHERE per.telefono IS NULL
 ORDER BY apellido1, apellido2, per.nombre;
 
 -- 3
  SELECT DISTINCT apellido1, apellido2, per.nombre
 FROM universidad.persona per JOIN universidad.alumno_se_matricula_asignatura mat
 ON per.id=mat.id_alumno
 WHERE YEAR(fecha_nacimiento) = 1999
 ORDER BY apellido1, apellido2, per.nombre;
 
-- 4
SELECT DISTINCT apellido1, apellido2, per.nombre
 FROM universidad.persona per JOIN universidad.profesor prof
 ON per.id=prof.id_profesor
 WHERE per.telefono IS NULL AND nif LIKE "%K"
 ORDER BY apellido1, apellido2, per.nombre;
 
-- 5
SELECT asig.nombre
	FROM universidad.asignatura asig
    WHERE asig.curso = 3 AND asig.id_grado = 7 AND asig.cuatrimestre = 1;

-- 6
SELECT per.apellido1, per.apellido2, per.nombre, dep.nombre AS departamento
	FROM universidad.profesor prof JOIN universidad.departamento dep
    ON prof.id_departamento = dep.id
    JOIN universidad.persona per ON prof.id_profesor = per.id
    ORDER BY per.apellido1, per.apellido2, per.nombre;

-- 7 
SELECT asig.nombre, curs.anyo_inicio, curs.anyo_fin
	FROM universidad.asignatura asig 
    JOIN universidad.alumno_se_matricula_asignatura mat
    ON asig.id = mat.id_asignatura
    JOIN universidad.persona per
    ON mat.id_alumno=per.id
    JOIN universidad.curso_escolar curs
    ON mat.id_curso_escolar=curs.id
    WHERE per.nif="26902806M";
-- 8
SELECT DISTINCT dep.nombre
	FROM  universidad.departamento dep JOIN universidad.profesor prof
    ON dep.id=prof.id_departamento
    JOIN universidad.asignatura asig ON prof.id_profesor=asig.id_profesor
    JOIN universidad.grado ON grado.id=asig.id_grado
    WHERE grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
-- 9
SELECT DISTINCT per.nombre, per.apellido1, per.apellido2
FROM universidad.persona per JOIN universidad.alumno_se_matricula_asignatura mat
ON per.id = mat.id_alumno
JOIN universidad.curso_escolar curs ON mat.id_curso_escolar=curs.id
WHERE curs.anyo_inicio = 2018 and curs.anyo_fin = 2019;

-- UNIVERSIDAD OUTER JOIN
-- 1
SELECT dep.nombre, per.apellido1, per.apellido2, per.nombre
FROM universidad.persona per RIGHT JOIN universidad.profesor prof
ON per.id = prof.id_profesor
LEFT JOIN universidad.departamento dep ON prof.id_departamento = dep.id
ORDER BY dep.nombre ASC, per.apellido1 ASC, per.apellido2 ASC, per.nombre ASC;

-- 2
SELECT dep.nombre, per.apellido1, per.apellido2, per.nombre
FROM universidad.persona per RIGHT JOIN universidad.profesor prof
ON per.id = prof.id_profesor
LEFT JOIN universidad.departamento dep ON prof.id_departamento = dep.id
WHERE dep.id IS NULL;

-- 3 
SELECT dep.nombre
FROM universidad.departamento dep LEFT JOIN universidad.profesor prof
ON dep.id = prof.id_departamento
WHERE prof.id_profesor IS NULL;

-- 4
SELECT per.apellido1, per.apellido2, per.nombre
FROM universidad.persona per RIGHT JOIN universidad.profesor prof
ON per.id=prof.id_profesor
LEFT JOIN universidad.asignatura asig ON prof.id_profesor=asig.id_profesor
WHERE asig.id IS NULL;

-- 5
SELECT asig.nombre
FROM universidad.asignatura asig LEFT JOIN universidad.profesor prof
ON asig.id_profesor = prof.id_profesor
WHERE prof.id_profesor IS NULL;

-- 6
SELECT DISTINCT dep.nombre
	FROM universidad.departamento dep JOIN universidad.profesor prof
    ON prof.id_departamento = dep.id
	LEFT JOIN universidad.asignatura asig 
    ON prof.id_profesor = asig.id_profesor
    LEFT JOIN universidad.alumno_se_matricula_asignatura mat
    ON asig.id= mat.id_asignatura
    WHERE NOT EXISTS (SELECT mat2.id_curso_escolar 
    FROM universidad.alumno_se_matricula_asignatura mat2
    WHERE mat2.id_curso_escolar = mat.id_curso_escolar)
    AND NOT EXISTS (SELECT asig2.nombre
    FROM universidad.asignatura asig2
    WHERE asig2.nombre=asig.nombre);

-- UNIVERSIDAD CONSULTAS RESUMEN
-- 1
SELECT COUNT(DISTINCT mat.id_alumno) AS númeroAlumnos
FROM universidad.alumno_se_matricula_asignatura mat;

-- 2
SELECT COUNT(DISTINCT mat.id_alumno) AS númeroAlumnos
FROM universidad.alumno_se_matricula_asignatura mat
JOIN universidad.persona pers ON mat.id_alumno = pers.id
WHERE fecha_nacimiento >=01/01/1999 AND fecha_nacimiento<=31/12/1999;

-- 3
SELECT dep.nombre, COUNT(prof.id_profesor) AS numeroProfesores
FROM universidad.departamento dep JOIN universidad.profesor prof
ON dep.id = prof.id_departamento JOIN universidad.persona pers
ON prof.id_profesor = pers.id
GROUP BY dep.nombre
ORDER BY numeroProfesores DESC;

-- 4
SELECT dep.nombre, COUNT(prof.id_profesor) AS numeroProfesores
FROM universidad.departamento dep LEFT JOIN universidad.profesor prof
ON dep.id = prof.id_departamento LEFT JOIN universidad.persona pers
ON prof.id_profesor = pers.id
GROUP BY dep.nombre
ORDER BY numeroProfesores DESC;

-- 5
SELECT grad.nombre, COUNT(asign.id) AS numeroAsignaturas
FROM universidad.grado grad LEFT JOIN universidad.asignatura asign
ON grad.id=asign.id_grado
GROUP BY grad.nombre
ORDER BY numeroAsignaturas DESC;

-- 6
SELECT grad.nombre, COUNT(asign.id) AS numeroAsignaturas
FROM universidad.grado grad LEFT JOIN universidad.asignatura asign
ON grad.id=asign.id_grado
GROUP BY grad.nombre
HAVING numeroAsignaturas > 40;

-- 7
SELECT grad.nombre, asign.tipo, sum(asign.creditos) as totalCreditos
FROM universidad.grado grad LEFT JOIN universidad.asignatura asign
ON grad.id=asign.id_grado
GROUP BY grad.nombre, asign.tipo
ORDER BY totalCreditos DESC;

-- 8
SELECT curs.anyo_inicio, COUNT(DISTINCT mat.id_alumno) as numeroAlumnos
FROM universidad.curso_escolar curs JOIN universidad.alumno_se_matricula_asignatura mat
ON curs.id=mat.id_curso_escolar
GROUP BY curs.anyo_inicio
ORDER BY numeroAlumnos;

-- 9
SELECT prof.id_profesor, pers.nombre, pers.apellido1, 
pers.apellido2, COUNT(asign.id) AS numeroAsignaturas
FROM universidad.profesor prof JOIN universidad.persona pers
ON prof.id_profesor = pers.id
LEFT JOIN universidad. asignatura asign ON prof.id_profesor = asign.id_profesor
GROUP BY prof.id_profesor
ORDER BY numeroAsignaturas DESC;

-- 10
SELECT DISTINCT pers.* FROM universidad.persona pers 
JOIN universidad.alumno_se_matricula_asignatura mat
ON pers.id = mat.id_alumno
WHERE pers.fecha_nacimiento = (SELECT MAX(persona.fecha_nacimiento) 
	FROM universidad.persona);

-- 11
SELECT pers.nombre, pers.apellido1, pers.apellido2, dep.nombre
FROM universidad.persona pers 
JOIN universidad.profesor prof ON prof.id_profesor=pers.id
JOIN universidad.departamento dep ON prof.id_departamento=dep.id
LEFT JOIN universidad.asignatura asign ON prof.id_profesor=asign.id_profesor
WHERE asign.id IS NULL;



    


