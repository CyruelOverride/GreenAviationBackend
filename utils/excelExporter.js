import ExcelJS from 'exceljs';
import { getHistorialAlumno } from '../models/User.repository.js';

/**
 * Función que recorre los exámenes del alumno y extrae información sobre preSolo y final
 * @param {Array} examenes - Array de exámenes del historial del alumno
 * @returns {Object} Objeto con información de preSolo y final
 */
const obtenerExamenesPreSoloYFinal = (examenes) => {
  let examenPreSolo = null;
  let examenFinal = null;

  if (!examenes || !Array.isArray(examenes)) {
    return { examenPreSolo: null, examenFinal: null };
  }

  for (const examen of examenes) {
    const capitulo = String(examen.capitulo || '').toLowerCase().trim();
    const nombre = String(examen.nombre || '').toLowerCase().trim();

   
    if (!examenPreSolo && (
      capitulo.includes('pre-solo') ||
      capitulo.includes('presolo') ||
      capitulo.includes('pre solo') ||
      nombre.includes('pre-solo') ||
      nombre.includes('presolo') ||
      nombre.includes('pre solo')
    )) {
      examenPreSolo = {
        existe: true,
        completado: examen.estado === 'COMPLETADO',
        puntaje: examen.puntaje,
      };
    }

    
    if (!examenFinal && (
      capitulo.includes('final') ||
      capitulo.includes('general') ||
      nombre.includes('examen final') ||
      nombre.includes('final') ||
      nombre.includes('general')
    )) {
      examenFinal = {
        existe: true,
        completado: examen.estado === 'COMPLETADO',
        puntaje: examen.puntaje,
      };
    }

    if (examenPreSolo && examenFinal) {
      break;
    }
  }

  return {
    examenPreSolo: examenPreSolo || { existe: false, completado: false, puntaje: null },
    examenFinal: examenFinal || { existe: false, completado: false, puntaje: null }
  };
};

/**
 * Función que recorre los vuelos del alumno y extrae información sobre vuelos específicos
 * @param {Array} vuelos - Array de vuelos del historial del alumno
 * @returns {Object} Objeto con información de vuelos específicos
 */
const obtenerVuelosEspecificos = (vuelos) => {
  let vueloSolo = null;
  let vueloNavegacion = null;
  let vueloHabilitacion = null;
  let vueloAeronaveCompleja = null;
  let examenVuelo = null;
  let examenVueloDinacia = null;

  if (!vuelos || !Array.isArray(vuelos)) {
    return {
      vueloSolo: null,
      vueloNavegacion: null,
      vueloHabilitacion: null,
      vueloAeronaveCompleja: null,
      examenVuelo: null,
      examenVueloDinacia: null
    };
  }

  // Filtrar vuelos por tipo y encontrar los específicos
  const vuelosSolo = vuelos.filter(v => v.tipo === 'vueloSolo');
  const vuelosNavegacion = vuelos.filter(v => v.tipo === 'navegacionSolo');
  const vuelosHabilitacion = vuelos.filter(v => v.tipo === 'habilitacionAvion');
  const vuelosAeronaveCompleja = vuelos.filter(v => v.tipo === 'aeronavesComplejas');
  const vuelosExamen = vuelos.filter(v => v.tipo === 'examen' || v.tipo === 'examenVuelo');
  const vuelosExamenDinacia = vuelos.filter(v => v.tipo === 'examenDinacia' || v.tipo === 'examenVueloDinacia');

  // Obtener vuelo solo con fecha más antigua
  if (vuelosSolo.length > 0) {
    // Ordenar por fecha ascendente (más antiguo primero)
    vuelosSolo.sort((a, b) => {
      const fechaA = new Date(a.fecha);
      const fechaB = new Date(b.fecha);
      return fechaA - fechaB;
    });
    
    const vueloMasAntiguo = vuelosSolo[0];
    vueloSolo = {
      existe: true,
      calificacion: vueloMasAntiguo.calificacion || null,
      matricula: vueloMasAntiguo.matricula || null,
      modelo: vueloMasAntiguo.modelo || null,
      aerod: vueloMasAntiguo.aerod || null,
      fecha: vueloMasAntiguo.fecha || null

    };

  }

  // Obtener primer vuelo de navegación (si hay varios, tomar el primero encontrado)
  if (vuelosNavegacion.length > 0) {
    const vueloNav = vuelosNavegacion[0];
    vueloNavegacion = {
      existe: true,
      calificacion: vueloNav.calificacion || null,
      matricula: vueloNav.matricula || null,
      modelo: vueloNav.modelo || null,
      aerod: vueloNav.aerod || null,
      fecha: vueloNav.fecha || null
    };
  }

  // Obtener primer vuelo de habilitación
  if (vuelosHabilitacion.length > 0) {
    const vueloHab = vuelosHabilitacion[0];
    vueloHabilitacion = {
      existe: true,
      calificacion: vueloHab.calificacion || null,
      matricula: vueloHab.matricula || null,
      modelo: vueloHab.modelo || null,
      aerod: vueloHab.aerod || null,
      fecha: vueloHab.fecha || null
    };
  }

  // Obtener primer vuelo de aeronave compleja
  if (vuelosAeronaveCompleja.length > 0) {
    const vueloAer = vuelosAeronaveCompleja[0];
    vueloAeronaveCompleja = {
      existe: true,
      calificacion: vueloAer.calificacion || null,
      matricula: vueloAer.matricula || null,
      modelo: vueloAer.modelo || null,
      aerod: vueloAer.aerod || null,
      fecha: vueloAer.fecha || null
    };
  }

  // Obtener primer vuelo de examen
  if (vuelosExamen.length > 0) {
    const vueloExamen = vuelosExamen[0];
    examenVuelo = {
      existe: true,
      calificacion: vueloExamen.calificacion || null,
      matricula: vueloExamen.matricula || null,
      modelo: vueloExamen.modelo || null,
      aerod: vueloExamen.aerod || null,
      fecha: vueloExamen.fecha || null,
      puntaje: vueloExamen.calificacion || null
    };
  }

  // Obtener primer vuelo de examen Dinacia
  if (vuelosExamenDinacia.length > 0) {
    const vueloExamenDin = vuelosExamenDinacia[0];
    examenVueloDinacia = {
      existe: true,
      calificacion: vueloExamenDin.calificacion || null,
      matricula: vueloExamenDin.matricula || null,
      modelo: vueloExamenDin.modelo || null,
      aerod: vueloExamenDin.aerod || null,
      fecha: vueloExamenDin.fecha || null,
      puntaje: vueloExamenDin.calificacion || null,
      inspectorDinacia: vueloExamenDin.inspectorDinacia || null
    };
  }

  return {
    vueloSolo: vueloSolo || { existe: false, calificacion: null, matricula: null, modelo: null, aerod: null, fecha: null },
    vueloNavegacion: vueloNavegacion || { existe: false, calificacion: null, matricula: null, modelo: null, aerod: null, fecha: null },
    vueloHabilitacion: vueloHabilitacion || { existe: false, calificacion: null, matricula: null, modelo: null, aerod: null, fecha: null },
    vueloAeronaveCompleja: vueloAeronaveCompleja || { existe: false, calificacion: null, matricula: null, modelo: null, aerod: null, fecha: null },
    examenVuelo: examenVuelo || { existe: false, calificacion: null, matricula: null, modelo: null, aerod: null, fecha: null, puntaje: null },
    examenVueloDinacia: examenVueloDinacia || { existe: false, calificacion: null, matricula: null, modelo: null, aerod: null, fecha: null, puntaje: null, inspectorDinacia: null }
  };
};

// Función auxiliar para manejar valores null/undefined y dejarlos vacíos
const safeValue = (value) => {
  if (value === null || value === undefined) return '';
  return value;
};

// Función auxiliar para aplicar alineación a la derecha a celdas que no son títulos
const setCellValueRight = (worksheet, cellAddress, value) => {
  const cell = worksheet.getCell(cellAddress);
  cell.value = safeValue(value);
  cell.alignment = { horizontal: 'right', vertical: 'top' };
};

export const exportarAlumnoExcel = async (alumnoId) => {
  const historialAlumnoCompleto = await getHistorialAlumno(alumnoId);

  if (!historialAlumnoCompleto) {
    throw new Error('Historial de alumno no encontrado');
  }

  // Extraer datos del usuario
  const usuario = historialAlumnoCompleto.usuario || {};
  const entrenamientoPrevio = historialAlumnoCompleto.entrenamientoPrevio || {};
  const inscripciones = historialAlumnoCompleto.inscripciones || [];
  const primeraInscripcion = inscripciones.length > 0 ? inscripciones[0] : null;

  // Obtener información de exámenes preSolo y final
  const { examenPreSolo, examenFinal } = obtenerExamenesPreSoloYFinal(historialAlumnoCompleto.examenes || []);
  
  // Obtener información de vuelos específicos
  const { vueloSolo, vueloNavegacion, vueloHabilitacion, vueloAeronaveCompleja, examenVuelo, examenVueloDinacia } = obtenerVuelosEspecificos(historialAlumnoCompleto.vuelos || []);
  
  // Calcular edad del alumno
  let edadAlumno = null;
  if (usuario?.fechaNac) {
    const fechaNac = new Date(usuario.fechaNac);
    const hoy = new Date();
    edadAlumno = hoy.getFullYear() - fechaNac.getFullYear();
    const mes = hoy.getMonth() - fechaNac.getMonth();
    if (mes < 0 || (mes === 0 && hoy.getDate() < fechaNac.getDate())) {
      edadAlumno--;
    }
  }

  const workbook = new ExcelJS.Workbook();
  const worksheet = workbook.addWorksheet('Historial de Vuelo');
  
  // Configurar ancho de columnas
  // Columnas A y B: más anchas (22)
  worksheet.getColumn('A').width = 22;
  worksheet.getColumn('B').width = 22;
  
  // Resto de columnas: aumentar 10% desde el ancho por defecto (10 * 1.1 = 11)
  worksheet.getColumn('C').width = 11;
  worksheet.getColumn('D').width = 11;
  worksheet.getColumn('E').width = 11;
  worksheet.getColumn('F').width = 11;
  worksheet.getColumn('G').width = 11;
  
  const imageId = workbook.addImage({
    filename: './assets/greenAviationLogo.jpeg', 
    extension: 'jpeg'
  });
 

  worksheet.mergeCells("A1:F1");
  const titulo = worksheet.getCell("A1");
  worksheet.getRow(1).height = 50;
  titulo.value = "REGISTRO DE VUELO ALUMNO - PILOTO PRIVADO";
  titulo.font = {
    name: 'Arial',
    size: 16,
    bold: true,
    color: { argb: 'FF000000' } // Negro para el texto
  };
  titulo.alignment = { horizontal: 'center', vertical: 'center' };
  titulo.fill = { 
    type: 'pattern', 
    pattern: 'solid', 
    fgColor: { argb: 'FFFFFFFF' } // Blanco para el fondo
  };
  titulo.border = { top: { style: 'thin' }, bottom: { style: 'thin' }, left: { style: 'thin' }, right: { style: 'thin' } };
  
  worksheet.addImage(imageId, {
    tl: { col: 6, row: 0 },  
    ext: { width: 140, height: 45 }
  });

  worksheet.mergeCells('A2:F2');

    const datosAlumno = worksheet.getCell('A2');
    datosAlumno.value = 'DATOS ALUMNO';

    datosAlumno.font = { bold: true };
    datosAlumno.alignment = { horizontal: 'center' };

    datosAlumno.fill = {
    type: 'pattern',
    pattern: 'solid',
    fgColor: { argb: 'FFD9D9D9' } 
    };

    worksheet.getCell('A3').value = 'Nombre del piloto:';
    setCellValueRight(worksheet, 'B3', ((usuario.nombre || '') + ' ' + (usuario.apellido || '')).trim());
    worksheet.getCell('A4').value = 'Fecha de Nacimiento:';
    setCellValueRight(worksheet, 'B4', usuario.fechaNac);
    worksheet.getCell('A5').value = 'Correo Electrónico:';
    setCellValueRight(worksheet, 'B5', usuario.email);
    worksheet.getCell('A6').value = 'Teléfono:';
    setCellValueRight(worksheet, 'B6', usuario.telefono);
    worksheet.getCell('A7').value = 'Dirección:';
    setCellValueRight(worksheet, 'B7', usuario.direccion);
    worksheet.getCell('A8').value = 'Departamento:';
    setCellValueRight(worksheet, 'B8', usuario.departamento);
    worksheet.getCell('A9').value = 'Contacto de emergencia:';
    setCellValueRight(worksheet, 'B9', usuario.contactoEmergencia);
    worksheet.getCell('A10').value = 'Nombre:';
    setCellValueRight(worksheet, 'B10', usuario.nombreEmergencia);
    worksheet.getCell('A11').value = 'Emergencia Médica:';
    setCellValueRight(worksheet, 'B11', usuario.emergenciaMedica);
    worksheet.getCell('C4').value = "Edad:";
    setCellValueRight(worksheet, 'D4', edadAlumno);
    worksheet.getCell('F4').value = "Sexo:";
    setCellValueRight(worksheet, 'G4', usuario.sexo);
    worksheet.getCell('C6').value = "Ciudad:";
    setCellValueRight(worksheet, 'D6', usuario.ciudad);
    worksheet.getCell('C7').value = "CP";
    setCellValueRight(worksheet, 'D7', ''); // CP no está en la base de datos
    worksheet.getCell('C10').value = "Telefono-cel";
    setCellValueRight(worksheet, 'D10', usuario.celular);

    worksheet.mergeCells('A12:F12');

    const inscripcion = worksheet.getCell('A12');
    inscripcion.value = 'DATOS INSCRIPCION';
    inscripcion.font = { bold: true };
    inscripcion.alignment = { horizontal: 'center' };
    inscripcion.fill = {
    type: 'pattern',
    pattern: 'solid',
    fgColor: { argb: 'FFD9D9D9' } 
    };
    worksheet.getCell('A13').value = 'Fecha de Inscripción:';
    setCellValueRight(worksheet, 'B13', primeraInscripcion ? primeraInscripcion.fecha : '');
    worksheet.getCell('A14').value = 'Certificado Medico - clase:';
    setCellValueRight(worksheet, 'B14', primeraInscripcion ? primeraInscripcion.certificadoMedico : '');
    worksheet.getCell('C14').value = 'F.Emitida:';
    setCellValueRight(worksheet, 'D14', primeraInscripcion ? primeraInscripcion.fechaEmitidoCertificadoMedico : '');
    worksheet.getCell('E14').value = 'F.Vencimiento:';
    setCellValueRight(worksheet, 'F14', primeraInscripcion ? primeraInscripcion.vencimientoCertificadoMedico : '');
    worksheet.getCell('A15').value = 'Licencia Alumno:';
    setCellValueRight(worksheet, 'B15', primeraInscripcion ? primeraInscripcion.licenciaAlumno : '');
    worksheet.getCell('C15').value = 'F.Emitida:';
    setCellValueRight(worksheet, 'D15', primeraInscripcion ? primeraInscripcion.fechaEmitidoLicenciaAlumno : '');
    worksheet.getCell('E15').value = 'F.Vencimiento:';
    setCellValueRight(worksheet, 'F15', primeraInscripcion ? primeraInscripcion.vencimientoLicenciaAlumno : '');

    worksheet.mergeCells('A16:F16');

    const tituloEntrenamientoPrevio = worksheet.getCell('A16');
    tituloEntrenamientoPrevio.value = 'ENTRENAMIENTO PREVIO';
    tituloEntrenamientoPrevio.font = { bold: true };
    tituloEntrenamientoPrevio.alignment = { horizontal: 'center' };
    tituloEntrenamientoPrevio.fill = {
    type: 'pattern',
    pattern: 'solid',
    fgColor: { argb: 'FFD9D9D9' } 
    };
    worksheet.getCell('A17').value = 'Dual:';
    setCellValueRight(worksheet, 'B17', entrenamientoPrevio.dual);
    worksheet.getCell('A18').value = 'Solo:';
    setCellValueRight(worksheet, 'B18', entrenamientoPrevio.solo);
    worksheet.getCell('A19').value = 'Nocturno solo:';
    setCellValueRight(worksheet, 'B19', entrenamientoPrevio.nocturnoSolo);
    worksheet.getCell('A20').value = 'Instruccion Teorica:';
    setCellValueRight(worksheet, 'B20', entrenamientoPrevio.instruccionTeorica);
    worksheet.getCell('A21').value = 'Instruccion Previa Tierra:';
    setCellValueRight(worksheet, 'B21', entrenamientoPrevio.instruccionTierra);
    worksheet.getCell('A22').value = 'Instruccion Previa Vuelo:';
    setCellValueRight(worksheet, 'B22', entrenamientoPrevio.instruccionVuelo);
    worksheet.getCell('C17').value = 'Nav Dual:';
    setCellValueRight(worksheet, 'D17', entrenamientoPrevio.navDual);
    worksheet.getCell('C18').value = 'Nav Solo:';
    setCellValueRight(worksheet, 'D18', entrenamientoPrevio.navSolo);
    worksheet.getCell('C19').value = 'Nav Nocturno:';
    setCellValueRight(worksheet, 'D19', entrenamientoPrevio.noctSolo);
    worksheet.mergeCells('C20:D20');
    worksheet.getCell('C20').value = 'Aterrizaje Nocturno:';
    setCellValueRight(worksheet, 'D20', entrenamientoPrevio.aterrizajesNoct);
    worksheet.mergeCells('C21:D21');
    worksheet.getCell('C21').value = 'Chequeo completo:';
    setCellValueRight(worksheet, 'D21', entrenamientoPrevio.chequeoFasesComp);
    worksheet.mergeCells('C22:D22');
    worksheet.getCell('C22').value = 'Ciac instructor:';
    setCellValueRight(worksheet, 'D22', entrenamientoPrevio.ciacInstructor);

    
    worksheet.mergeCells('A23:B23');

    const certificadoTransferencia = worksheet.getCell('A23');
    certificadoTransferencia.value = 'CERTIFICADO DE TRANSFERENCIA DEL CIAC O INSTRUCTOR';
    certificadoTransferencia.font = { bold: false };
    certificadoTransferencia.alignment = { horizontal: 'left' };
    certificadoTransferencia.fill = {
    type: 'pattern',
    pattern: 'solid',
    fgColor: { argb: 'FFFFFFFF' } // Fondo blanco en lugar de gris
    };
    worksheet.getCell('C23').value = 'Si';
    setCellValueRight(worksheet, 'D23', entrenamientoPrevio.carteDeTransferencia ? 'X' : '');
    worksheet.getCell('E23').value = 'No';
    setCellValueRight(worksheet, 'F23', entrenamientoPrevio.carteDeTransferencia ? '' : 'X');

    worksheet.mergeCells('A24:F24');
    
    const vueloSoloAutorizacion = worksheet.getCell('A24');
    vueloSoloAutorizacion.value = 'VUELO SOLO - AUTORIZACIONES';
    vueloSoloAutorizacion.font = { bold: true };
    vueloSoloAutorizacion.alignment = { horizontal: 'center' };
    vueloSoloAutorizacion.fill = {
    type: 'pattern',
    pattern: 'solid',
    fgColor: { argb: 'FFD9D9D9' } 
    };
    
    worksheet.getCell('A25').value = 'Pre vuelo solo examen:';
    setCellValueRight(worksheet, 'B25', examenPreSolo.existe 
      ? examenPreSolo.puntaje
      : 'No realizado');
    worksheet.mergeCells('C25:D25');
    worksheet.getCell('C25').value = 'Firma del instructor:';
    worksheet.mergeCells('E25:F25');

    worksheet.getCell('A26').value = 'Primer vuelo solo:';
    setCellValueRight(worksheet, 'B26', vueloSolo.existe 
      ? vueloSolo.calificacion
      : 'No realizado');
    worksheet.getCell('C26').value = 'Firma del instructor:';
    worksheet.mergeCells('C26:D26');
    worksheet.mergeCells('E26:F26');
    worksheet.getCell('A27').value = 'Matricula:';
    setCellValueRight(worksheet, 'B27', vueloSolo.existe ? vueloSolo.matricula : '');
    worksheet.getCell('C27').value = 'Modelo:';
    setCellValueRight(worksheet, 'D27', vueloSolo.existe ? vueloSolo.modelo : '');
    worksheet.getCell('E27').value = 'Aerod:';
    setCellValueRight(worksheet, 'F27', vueloSolo.existe ? vueloSolo.aerod : '');

    // Navegación Solo
    worksheet.getCell('A28').value = 'Navegación solo:';
    setCellValueRight(worksheet, 'B28', vueloNavegacion.existe 
      ? vueloNavegacion.calificacion
      : 'No realizado');
    worksheet.getCell('C28').value = 'Firma del instructor:';
    worksheet.mergeCells('C28:D28');
    worksheet.mergeCells('E28:F28');
    worksheet.getCell('A29').value = 'Matricula:';
    setCellValueRight(worksheet, 'B29', vueloNavegacion.existe ? vueloNavegacion.matricula : '');
    worksheet.getCell('C29').value = 'Modelo:';
    setCellValueRight(worksheet, 'D29', vueloNavegacion.existe ? vueloNavegacion.modelo : '');
    worksheet.getCell('E29').value = 'Aerod:';
    setCellValueRight(worksheet, 'F29', vueloNavegacion.existe ? vueloNavegacion.aerod : '');

    // Habilitación Avión
    worksheet.getCell('A30').value = 'Habilitación avión:';
    setCellValueRight(worksheet, 'B30', vueloHabilitacion.existe 
      ? vueloHabilitacion.calificacion
      : 'No realizado');
    worksheet.getCell('C30').value = 'Firma del instructor:';
    worksheet.mergeCells('C30:D30');
    worksheet.mergeCells('E30:F30');
    worksheet.getCell('A31').value = 'Matricula:';
    setCellValueRight(worksheet, 'B31', vueloHabilitacion.existe ? vueloHabilitacion.matricula : '');
    worksheet.getCell('C31').value = 'Modelo:';
    setCellValueRight(worksheet, 'D31', vueloHabilitacion.existe ? vueloHabilitacion.modelo : '');
    worksheet.getCell('E31').value = 'Aerod:';
    setCellValueRight(worksheet, 'F31', vueloHabilitacion.existe ? vueloHabilitacion.aerod : '');

    worksheet.getCell('A32').value = 'Aeronaves complejas:';
    setCellValueRight(worksheet, 'B32', vueloAeronaveCompleja.existe 
      ? vueloAeronaveCompleja.calificacion
      : 'No realizado');
    worksheet.getCell('C32').value = 'Firma del instructor:';
    worksheet.mergeCells('C32:D32');
    worksheet.mergeCells('E32:F32');
    worksheet.getCell('A33').value = 'Matricula:';
    setCellValueRight(worksheet, 'B33', vueloAeronaveCompleja.existe ? vueloAeronaveCompleja.matricula : '');
    worksheet.getCell('C33').value = 'Modelo:';
    setCellValueRight(worksheet, 'D33', vueloAeronaveCompleja.existe ? vueloAeronaveCompleja.modelo : '');
    worksheet.getCell('E33').value = 'Aerod:';
    setCellValueRight(worksheet, 'F33', vueloAeronaveCompleja.existe ? vueloAeronaveCompleja.aerod : '');

    worksheet.mergeCells('A34:F34');
    const examenes = worksheet.getCell('A34');
    examenes.value = 'EXAMENES';
    examenes.font = { bold: true };
    examenes.alignment = { horizontal: 'center' };
    examenes.fill = {
    type: 'pattern',
    pattern: 'solid',
    fgColor: { argb: 'FFD9D9D9' } 
    };
    worksheet.getCell('A35').value = 'Examen Teorico Escuela:';
    setCellValueRight(worksheet, 'B35', examenFinal.existe ? 'Realizado' : 'No realizado');
    worksheet.getCell('C35').value = 'NOTA:';
    worksheet.mergeCells('D35:F35');
    setCellValueRight(worksheet, 'D35', examenFinal.existe ? examenFinal.puntaje : 'No realizado');

    worksheet.getCell('A36').value = 'Examen Vuelo Escuela:';
    setCellValueRight(worksheet, 'B36', examenVuelo.existe ? 'Realizado' : 'No realizado');
    worksheet.getCell('C36').value = 'NOTA:';
    worksheet.mergeCells('D36:F36');
    setCellValueRight(worksheet, 'D36', examenVuelo.existe ? examenVuelo.puntaje : 'No realizado');

    worksheet.getCell('A37').value = 'Instructor en jefe:';
    worksheet.mergeCells('D37:F37');
    worksheet.getCell('C37').value = 'Licencia N:';

    worksheet.getCell('A38').value = 'Examen Vuelo Dinacia:';
    setCellValueRight(worksheet, 'B38', examenVueloDinacia.existe ? 'Realizado' : 'No realizado');
    worksheet.getCell('C38').value = 'NOTA:';
    worksheet.mergeCells('D38:F38');
    setCellValueRight(worksheet, 'D38', examenVueloDinacia.existe ? examenVueloDinacia.puntaje : 'No realizado');

    worksheet.getCell('A39').value = 'Inspector dinacia:';
    setCellValueRight(worksheet, 'B39', examenVueloDinacia.existe ? examenVueloDinacia.inspectorDinacia : '');

    worksheet.getCell('A40').value = 'Certificado de graduacion:';
    worksheet.mergeCells('D40:F40');
    worksheet.getCell('C40').value = 'Firmado:';

    worksheet.mergeCells('A41:F41');
    const certificadoGraduacion = worksheet.getCell('A41');
    certificadoGraduacion.value = 'RESUMEN DEL CURSO';
    certificadoGraduacion.font = { bold: true };
    certificadoGraduacion.alignment = { horizontal: 'center' };
    certificadoGraduacion.fill = {
    type: 'pattern',
    pattern: 'solid',
    fgColor: { argb: 'FFD9D9D9' } 
    };
    worksheet.mergeCells('A42:B42');
    worksheet.getCell('A42').value = 'TOTAL DESDE INSCRIPCION AL CURSO:';
    setCellValueRight(worksheet, 'C42', primeraInscripcion ? primeraInscripcion.totalDesdeInscripcion : '');
    worksheet.getCell('D42').value = 'HS. TEORICO:';
    worksheet.mergeCells('D42:E42');
    setCellValueRight(worksheet, 'F42', primeraInscripcion ? primeraInscripcion.hsTeorico : '');

    worksheet.mergeCells('A43:B43');
    worksheet.getCell('A43').value = 'TOTAL FASE TEORICA:';
    setCellValueRight(worksheet, 'C43', primeraInscripcion ? primeraInscripcion.totalFaseTeorica : '');
    worksheet.mergeCells('D43:E43');
    worksheet.getCell('D43').value = 'HS VUELO TOTAL:';
    setCellValueRight(worksheet, 'F43', primeraInscripcion ? primeraInscripcion.hsVueloTotal : '');
    worksheet.mergeCells('A44:B44');
    worksheet.getCell('A44').value = 'TOTAL FASE DE VUELO:';
    setCellValueRight(worksheet, 'C44', primeraInscripcion ? primeraInscripcion.totalFaseVuelo : '');
    worksheet.mergeCells('D44:E44');
    worksheet.getCell('D44').value = 'OTROS:';
    setCellValueRight(worksheet, 'F44', primeraInscripcion ? primeraInscripcion.otros : '');

  // Retornar el workbook para que pueda ser usado en el controller
  return workbook;
}