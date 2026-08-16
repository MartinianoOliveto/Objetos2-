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
}

class Empleado{
    const property nombre 
    const property direccion
    const property estadoCivil 
    const property fechaNacimiento 
    const property sueldoBasico

    method edad(){
        return 2026 - fechaNacimiento
    }
    method sueldoNeto(){
        return self.sueldoBruto() - self.retenciones()
    }
    method retenciones()
    method sueldoBruto() 
    method obraSocial()
    method aportes()

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
    override method obraSocial(){
        return self.sueldoBruto() * 0.1 + self.retencionPorHijos()
    }
    override method aportes(){
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
    override method obraSocial(){
        return self.sueldoBruto() * 0.1 + self.retencionPorEdad() 
    }
    override method aportes(){
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
CHEQUEAR UML 
INVESTIGAR COMO HACER LA RELACION ENTRE REIBO DE SUELDO Y EMPRESA, Y COMO IMPLEMENTARLA EN WOLLOK 

*/