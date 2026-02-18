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
    color: { rgb: 'FFFFFF' }
  };
  titulo.alignment = { horizontal: 'center', vertical: 'center' };
  titulo.fill = { type: 'pattern', pattern: 'solid', fgColor: { rgb: '000000' } };
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
    worksheet.getCell('B3').value = safeValue((usuario.nombre || '') + ' ' + (usuario.apellido || '')).trim();
    worksheet.getCell('A4').value = 'Fecha de Nacimiento:';
    worksheet.getCell('B4').value = safeValue(usuario.fechaNac);
    worksheet.getCell('A5').value = 'Correo Electrónico:';
    worksheet.getCell('B5').value = safeValue(usuario.email);
    worksheet.getCell('A6').value = 'Teléfono:';
    worksheet.getCell('B6').value = safeValue(usuario.telefono);
    worksheet.getCell('A7').value = 'Dirección:';
    worksheet.getCell('B7').value = safeValue(usuario.direccion);
    worksheet.getCell('A8').value = 'Departamento:';
    worksheet.getCell('B8').value = safeValue(usuario.departamento);
    worksheet.getCell('A9').value = 'Contacto de emergencia:';
    worksheet.getCell('B9').value = safeValue(usuario.contactoEmergencia);
    worksheet.getCell('A10').value = 'Nombre:';
    worksheet.getCell('B10').value = safeValue(usuario.nombreEmergencia);
    worksheet.getCell('A11').value = 'Emergencia Médica:';
    worksheet.getCell('B11').value = safeValue(usuario.emergenciaMedica);
    worksheet.getCell('C4').value = "Edad:";
    worksheet.getCell('D4').value = safeValue(edadAlumno);
    worksheet.getCell('F4').value = "Sexo:";
    worksheet.getCell('G4').value = safeValue(usuario.sexo);
    worksheet.getCell('C6').value = "Ciudad:";
    worksheet.getCell('D6').value = safeValue(usuario.ciudad);
    worksheet.getCell('C7').value = "CP";
    worksheet.getCell('D7').value = ''; // CP no está en la base de datos
    worksheet.getCell('C10').value = "Telefono-cel";
    worksheet.getCell('D10').value = safeValue(usuario.celular);

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
    worksheet.getCell('B13').value = primeraInscripcion ? safeValue(primeraInscripcion.fecha) : '';
    worksheet.getCell('A14').value = 'Certificado Medico - clase:';
    worksheet.getCell('B14').value = primeraInscripcion ? safeValue(primeraInscripcion.certificadoMedico) : '';
    worksheet.getCell('C14').value = 'F.Emitida:';
    worksheet.getCell('D14').value = primeraInscripcion ? safeValue(primeraInscripcion.fechaEmitidoCertificadoMedico) : '';
    worksheet.getCell('E14').value = 'F.Vencimiento:';
    worksheet.getCell('F14').value = primeraInscripcion ? safeValue(primeraInscripcion.vencimientoCertificadoMedico) : '';
    worksheet.getCell('A15').value = 'Licencia Alumno:';
    worksheet.getCell('B15').value = primeraInscripcion ? safeValue(primeraInscripcion.licenciaAlumno) : '';
    worksheet.getCell('C15').value = 'F.Emitida:';
    worksheet.getCell('D15').value = primeraInscripcion ? safeValue(primeraInscripcion.fechaEmitidoLicenciaAlumno) : '';
    worksheet.getCell('E15').value = 'F.Vencimiento:';
    worksheet.getCell('F15').value = primeraInscripcion ? safeValue(primeraInscripcion.vencimientoLicenciaAlumno) : '';

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
    worksheet.getCell('B17').value = safeValue(entrenamientoPrevio.dual);
    worksheet.getCell('A18').value = 'Solo:';
    worksheet.getCell('B18').value = safeValue(entrenamientoPrevio.solo);
    worksheet.getCell('A19').value = 'Nocturno solo:';
    worksheet.getCell('B19').value = safeValue(entrenamientoPrevio.nocturnoSolo);
    worksheet.getCell('A20').value = 'Instruccion Teorica:';
    worksheet.getCell('B20').value = safeValue(entrenamientoPrevio.instruccionTeorica);
    worksheet.getCell('A21').value = 'Instruccion Previa Tierra:';
    worksheet.getCell('B21').value = safeValue(entrenamientoPrevio.instruccionTierra);
    worksheet.getCell('A22').value = 'Instruccion Previa Vuelo:';
    worksheet.getCell('B22').value = safeValue(entrenamientoPrevio.instruccionVuelo);
    worksheet.getCell('C17').value = 'Nav Dual:';
    worksheet.getCell('D17').value = safeValue(entrenamientoPrevio.navDual);
    worksheet.getCell('C18').value = 'Nav Solo:';
    worksheet.getCell('D18').value = safeValue(entrenamientoPrevio.navSolo);
    worksheet.getCell('C19').value = 'Nav Nocturno:';
    worksheet.getCell('D19').value = safeValue(entrenamientoPrevio.noctSolo);
    worksheet.getCell('C20').value = 'Aterrizaje Nocturno:';
    worksheet.getCell('D20').value = safeValue(entrenamientoPrevio.aterrizajesNoct);
    worksheet.getCell('C21').value = 'Chequeo completo:';
    worksheet.getCell('D21').value = safeValue(entrenamientoPrevio.chequeoFasesComp);
    worksheet.getCell('C22').value = 'Ciac instructor:';
    worksheet.getCell('D22').value = safeValue(entrenamientoPrevio.ciacInstructor);

    
    worksheet.mergeCells('A23:B23');

    const certificadoTransferencia = worksheet.getCell('A23');
    certificadoTransferencia.value = 'CERTIFICADO DE TRANSFERENCIA DEL CIAC O INSTRUCTOR';
    certificadoTransferencia.font = { bold: true };
    certificadoTransferencia.alignment = { horizontal: 'center' };
    certificadoTransferencia.fill = {
    type: 'pattern',
    pattern: 'solid',
    fgColor: { argb: 'FFD9D9D9' } 
    };
    worksheet.getCell('C23').value = 'Si';
    worksheet.getCell('D23').value = entrenamientoPrevio.carteDeTransferencia ? 'X' : '';
    worksheet.getCell('E23').value = 'No';
    worksheet.getCell('F23').value = entrenamientoPrevio.carteDeTransferencia ? '' : 'X';

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
    worksheet.getCell('B25').value = examenPreSolo.existe 
      ? safeValue(examenPreSolo.puntaje)
      : 'No realizado';
    worksheet.mergeCells('C25:D25');
    worksheet.getCell('C25').value = 'Firma del instructor:';
    worksheet.mergeCells('E25:F25');

    worksheet.getCell('A26').value = 'Primer vuelo solo:';
    worksheet.getCell('B26').value = vueloSolo.existe 
      ? safeValue(vueloSolo.calificacion)
      : 'No realizado';
    worksheet.getCell('C26').value = 'Firma del instructor:';
    worksheet.mergeCells('C26:D26');
    worksheet.mergeCells('E26:F26');
    worksheet.getCell('A27').value = 'Matricula:';
    worksheet.getCell('B27').value = vueloSolo.existe ? safeValue(vueloSolo.matricula) : '';
    worksheet.getCell('C27').value = 'Modelo:';
    worksheet.getCell('D27').value = vueloSolo.existe ? safeValue(vueloSolo.modelo) : '';
    worksheet.getCell('E27').value = 'Aerod:';
    worksheet.getCell('F27').value = vueloSolo.existe ? safeValue(vueloSolo.aerod) : '';

    // Navegación Solo
    worksheet.getCell('A28').value = 'Navegación solo:';
    worksheet.getCell('B28').value = vueloNavegacion.existe 
      ? safeValue(vueloNavegacion.calificacion)
      : 'No realizado';
    worksheet.getCell('C28').value = 'Firma del instructor:';
    worksheet.mergeCells('C28:D28');
    worksheet.mergeCells('E28:F28');
    worksheet.getCell('A29').value = 'Matricula:';
    worksheet.getCell('B29').value = vueloNavegacion.existe ? safeValue(vueloNavegacion.matricula) : '';
    worksheet.getCell('C29').value = 'Modelo:';
    worksheet.getCell('D29').value = vueloNavegacion.existe ? safeValue(vueloNavegacion.modelo) : '';
    worksheet.getCell('E29').value = 'Aerod:';
    worksheet.getCell('F29').value = vueloNavegacion.existe ? safeValue(vueloNavegacion.aerod) : '';

    // Habilitación Avión
    worksheet.getCell('A30').value = 'Habilitación avión:';
    worksheet.getCell('B30').value = vueloHabilitacion.existe 
      ? safeValue(vueloHabilitacion.calificacion)
      : 'No realizado';
    worksheet.getCell('C30').value = 'Firma del instructor:';
    worksheet.mergeCells('C30:D30');
    worksheet.mergeCells('E30:F30');
    worksheet.getCell('A31').value = 'Matricula:';
    worksheet.getCell('B31').value = vueloHabilitacion.existe ? safeValue(vueloHabilitacion.matricula) : '';
    worksheet.getCell('C31').value = 'Modelo:';
    worksheet.getCell('D31').value = vueloHabilitacion.existe ? safeValue(vueloHabilitacion.modelo) : '';
    worksheet.getCell('E31').value = 'Aerod:';
    worksheet.getCell('F31').value = vueloHabilitacion.existe ? safeValue(vueloHabilitacion.aerod) : '';

    worksheet.getCell('A32').value = 'Aeronaves complejas:';
    worksheet.getCell('B32').value = vueloAeronaveCompleja.existe 
      ? safeValue(vueloAeronaveCompleja.calificacion)
      : 'No realizado';
    worksheet.getCell('C32').value = 'Firma del instructor:';
    worksheet.mergeCells('C32:D32');
    worksheet.mergeCells('E32:F32');
    worksheet.getCell('A33').value = 'Matricula:';
    worksheet.getCell('B33').value = vueloAeronaveCompleja.existe ? safeValue(vueloAeronaveCompleja.matricula) : '';
    worksheet.getCell('C33').value = 'Modelo:';
    worksheet.getCell('D33').value = vueloAeronaveCompleja.existe ? safeValue(vueloAeronaveCompleja.modelo) : '';
    worksheet.getCell('E33').value = 'Aerod:';
    worksheet.getCell('F33').value = vueloAeronaveCompleja.existe ? safeValue(vueloAeronaveCompleja.aerod) : '';

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
    worksheet.getCell('B35').value = examenFinal.existe ? 'Realizado' : 'No realizado';
    worksheet.getCell('C35').value = 'NOTA:';
    worksheet.mergeCells('D35:F35');
    worksheet.getCell('D35').value = examenFinal.existe ? safeValue(examenFinal.puntaje) : 'No realizado';

    worksheet.getCell('A36').value = 'Examen Vuelo Escuela:';
    worksheet.getCell('B36').value = examenVuelo.existe ? 'Realizado' : 'No realizado';
    worksheet.getCell('C36').value = 'NOTA:';
    worksheet.mergeCells('D36:F36');
    worksheet.getCell('D36').value = examenVuelo.existe ? safeValue(examenVuelo.puntaje) : 'No realizado';

    worksheet.getCell('A37').value = 'Instructor en jefe:';
    worksheet.mergeCells('D37:F37');
    worksheet.getCell('C37').value = 'Licencia N:';

    worksheet.getCell('A38').value = 'Examen Vuelo Dinacia:';
    worksheet.getCell('B38').value = examenVueloDinacia.existe ? 'Realizado' : 'No realizado';
    worksheet.getCell('C38').value = 'NOTA:';
    worksheet.mergeCells('D38:F38');
    worksheet.getCell('D38').value = examenVueloDinacia.existe ? safeValue(examenVueloDinacia.puntaje) : 'No realizado';

    worksheet.getCell('A39').value = 'Inspector dinacia:';
    worksheet.getCell('B39').value = examenVueloDinacia.existe ? safeValue(examenVueloDinacia.inspectorDinacia) : '';

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
    worksheet.getCell('C42').value = primeraInscripcion ? safeValue(primeraInscripcion.totalDesdeInscripcion) : '';
    worksheet.getCell('D42').value = 'HS. TEORICO:';
    worksheet.mergeCells('D42:E42');
    worksheet.getCell('F42').value = primeraInscripcion ? safeValue(primeraInscripcion.hsTeorico) : '';

    worksheet.mergeCells('A43:B43');
    worksheet.getCell('A43').value = 'TOTAL FASE TEORICA:';
    worksheet.getCell('C43').value = primeraInscripcion ? safeValue(primeraInscripcion.totalFaseTeorica) : '';
    worksheet.mergeCells('D43:E43');
    worksheet.getCell('D43').value = 'HS VUELO TOTAL:';
    worksheet.getCell('F43').value = primeraInscripcion ? safeValue(primeraInscripcion.hsVueloTotal) : '';
    worksheet.mergeCells('A44:B44');
    worksheet.getCell('A44').value = 'TOTAL FASE DE VUELO:';
    worksheet.getCell('C44').value = primeraInscripcion ? safeValue(primeraInscripcion.totalFaseVuelo) : '';
    worksheet.mergeCells('D44:E44');
    worksheet.getCell('D44').value = 'OTROS:';
    worksheet.getCell('F44').value = primeraInscripcion ? safeValue(primeraInscripcion.otros) : '';

  // Retornar el workbook para que pueda ser usado en el controller
  return workbook;
}