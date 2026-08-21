class Empresa{
    const property nombre 
    const property cuit 
    const empleados = #{}

    method totalSueldosNetos(){
        return empleados.sum{e => e.sueldoNeto()}
    }
    method totalSueldosBrutos(){
        return empleados.sum{e => e.sueldoBruto()}
    }
    method totalRetenciones(){
        return empleados.sum{e => e.retenciones()}
    }
    method liquidarSueldos(){
        empleados.forEach({e => e.liquidarSueldo()})
    }
}

class Empleado{
    const property nombre 
    const property direccion
    const property estadoCivil 
    const property fechaNacimiento 
    const property sueldoBasico
    const recibos = [] 

    method edad(){
        return 2026 - fechaNacimiento.year()
    }
    method sueldoNeto(){
        return self.sueldoBruto() - self.retenciones()
    }
    method retenciones()
    method sueldoBruto() 

    method liquidarSueldo(){
        self.agregarRecibo(self.crearRecibo())
    }
    method crearRecibo(){
        const recibo = new ReciboDeSueldo(nombreEmpleado = self.nombre(), direccion = self.direccion(), sueldoBasico = self.sueldoBasico(), 
                sueldoBruto =self.sueldoBruto(), sueldoNeto = self.sueldoNeto(), retenciones = self.retenciones(), fechaEmision = "21/8/2026")
        return recibo
    }
    method agregarRecibo(recibo){
        recibos.add(recibo)
    }
    method cantRecibos(){
        return recibos.size()
    }
}

class EmpleadoPermanente inherits Empleado{
    const property cantDeHijos 
    const property antiguedad 

    override method sueldoBruto(){
        return sueldoBasico + self.salarioFamiliar()
    }
    override method retenciones(){
        return self.obraSocial() + self.aportes()
    }
    method obraSocial(){
        return self.sueldoBruto() * 0.1 + self.retencionPorHijos()
    }
    method aportes(){
        return self.sueldoBruto() * 0.15
    }
    method salarioFamiliar(){
        return self.asignacionPorHijos() + self.asignacionPorConyuge() + self.asignacionAntiguedad() 
    }
    method asignacionPorHijos(){
        return 150 * cantDeHijos
    }
    method asignacionPorConyuge(){
        return estadoCivil.asignacion()
    }
    method asignacionAntiguedad(){
        return 50 * antiguedad 
    }
    method retencionPorHijos(){
        return 20 * cantDeHijos
    }
}

class EmpleadoTemporal inherits Empleado{
    const property fechaDesignacion 
    const property horasExtra 

    override method sueldoBruto(){
        return sueldoBasico + self.totalHorasExtras()
    }
    override method retenciones(){
        return self.obraSocial() + self.aportes()
    }
    method obraSocial(){
        return self.sueldoBruto() * 0.1 + self.retencionPorEdad() 
    }
    method aportes(){
        return self.sueldoBruto() * 0.1 + self.retencionHorasExtras()
    }
    method totalHorasExtras(){
        return 40 * horasExtra 
    }
    method retencionPorEdad(){
        return if(self.edad() > 50){
            25
        }else{
            0
        }
    }
    method retencionHorasExtras(){
        return 5 * horasExtra 
    }
}

class EmpleadoContratado inherits Empleado{
    const property numeroContrato 
    const property medioDePago

    override method sueldoBruto(){
        return sueldoBasico
    }
    override method retenciones(){
        return 50 
    }
}
class ReciboDeSueldo{
    const property nombreEmpleado
    const property direccion 
    const property fechaEmision 
    const property sueldoBasico 
    const property sueldoBruto
    const property sueldoNeto
    const property retenciones 

}


















class EstadoCivil{
    method asignacion()
}
class Soltero inherits EstadoCivil{
    override method asignacion(){
        return 0
    }
}
class Casado inherits EstadoCivil{
    override method asignacion(){
        return 100
    }
}





/*
HACER TESTS -hecho 
CHEQUEAR UML -hecho 
INVESTIGAR COMO HACER LA RELACION ENTRE REIBO DE SUELDO Y EMPRESA, Y COMO IMPLEMENTARLA EN WOLLOK 
CAMBIAR estadocivil
*/