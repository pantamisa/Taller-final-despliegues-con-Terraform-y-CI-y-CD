# Infraestructura como Código - Taller DevOps ITM
# Proveedor "local": no requiere nube ni pagos.
 
terraform {
  required_version = ">= 1.5.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}
 
variable "nombre_proyecto" {
  description = "Nombre del proyecto que se aprovisiona"
  type        = string
  default     = "taller-devops"
}
 
variable "ambiente" {
  description = "Ambiente de destino: desarrollo, pruebas o produccion"
  type        = string
  default     = "desarrollo"
}
 
resource "local_file" "configuracion_ambiente" {
  filename = "${path.module}/salida/${var.ambiente}.env"
  content  = <<-EOT
    PROYECTO=${var.nombre_proyecto}
    AMBIENTE=${var.ambiente}
    PUERTO_WEB=8080
  EOT
}
 
output "archivo_creado" {
  description = "Ruta del archivo aprovisionado"
  value       = local_file.configuracion_ambiente.filename
}
