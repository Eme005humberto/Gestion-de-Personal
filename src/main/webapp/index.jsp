<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Lista de empleados</title>
<!-- Font Awesome 6 (CSS) -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<!-- Bootstrap 5 (CSS) -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- DataTables + Bootstrap 5 (CSS) -->
<link
	href="https://cdn.jsdelivr.net/npm/datatables.net-bs5@1.13.10/css/dataTables.bootstrap5.min.css"
	rel="stylesheet">
<!-- DataTables Responsive + Bootstrap 5 (CSS) -->
<link
	href="https://cdn.jsdelivr.net/npm/datatables.net-responsive-bs5@2.5.0/css/responsive.bootstrap5.min.css"
	rel="stylesheet">
<!-- Bootstrap Icons (opcional) -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
	rel="stylesheet">
<!-- Fuente única para coherencia -->
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">

<style>
body {
	font-family: "Inter", system-ui, -apple-system, "Segoe UI", Roboto,
		sans-serif;
	background: #f5f7fb;
}

.page-title {
	font-weight: 600;
	letter-spacing: .3px;
}

.card {
	border: 0;
	border-radius: 1rem;
	box-shadow: 0 10px 25px rgba(0, 0, 0, .06);
}

table.dataTable tbody tr:hover {
	background-color: #f8fafc;
}
</style>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand fw-semibold" href="">Gestion de personal <i
				class="fa-solid fa-users"></i>
			</a>
		</div>
	</nav>

	<div class="container py-4">
		<div class="d-flex align-items-center justify-content-between mb-3">
			<h1 class="page-title h3 mb-0">Registro de empleados</h1>
			<a href="#" class="btn btn-primary" data-bs-toggle="modal"
				data-bs-target="#modalEmpleado"> <i class="bi bi-plus-circle"></i>
				Nuevo registro
			</a>
		</div>
		<div class="d-flex align-items-center justify-content-between mb-3">
			<a href="" class="btn btn-outline-danger"> <i
				class="bi bi-filetype-pdf"></i> Descargar PDF
			</a>
		</div>
		<div class="card">
			<div class="card-body">
				<table id="tabla-empleados"
					class="table table-striped table-hover table-bordered align-middle nowrap w-100">
					<thead class="table-light">
						<tr>
							<th>ID</th>
							<th>Nombre</th>
							<th>Apellido</th>
							<th>Dui</th>
							<th>Cargo</th>
							<th>Salario</th>
							<th>Acciones</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="e" items="${empleados}">
							<tr>
								<td>${e.id}</td>
								<td>${e.nombre}</td>
								<td>${e.apellido }</td>
								<td>${e.dui }</td>
								<td>${e.cargo}</td>
								<td>${e.salario}</td>
								<td>
									<div class="d-flex gap-2">
										<a
											href="${pageContext.request.contextPath}/SvEmpleados?accion=editar&id=${e.id}"
											class="btn btn-outline-primary"> <i
											class="bi bi-pencil-square"></i> Editar
										</a>
										<form
											action="${pageContext.request.contextPath}/SvEmpleados?accion=eliminar"
											method="post" class="d-inline form-eliminar">
											<input type="hidden" name="id" value="${e.id}">
											<button type="button" class="btn btn-outline-danger"
												onclick="confirmarEliminar(this)">
												<i class="bi bi-trash"></i> Eliminar
											</button>
										</form>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- Modal: Agregar Empleado -->
	<div class="modal fade" id="modalEmpleado" tabindex="-1"
		aria-labelledby="modalEmpleadoLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<form id="formEmpleado" class="needs-validation" method="post"
					novalidate="novalidate"
					action="${pageContext.request.contextPath}/SvEmpleados?accion=insertar">
					<div class="modal-header">
						<h5 class="modal-title" id="modalEmpleadoLabel">
							<i class="bi bi-person-plus"></i> Agregar empleado
						</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Cerrar"></button>
					</div>

					<div class="modal-body">
						<div class="row g-3">
							<div class="col-md-6">
								<label class="form-label">Nombre</label> <input type="text"
									name="nombre" class="form-control" required maxlength="100">
								<div class="invalid-feedback">Ingresa el nombre.</div>
							</div>
							<div class="col-md-6">
								<label class="form-label">Apellido</label> <input type="text"
									name="apellido" class="form-control" required maxlength="100">
								<div class="invalid-feedback">Ingresa el apellido.</div>
							</div>

							<div class="col-md-6">
								<label class="form-label">DUI</label> <input type="text"
									name="dui" class="form-control" pattern="^[0-9]{8}-[0-9]{1}$"
									placeholder="01234567-8" required>
								<div class="invalid-feedback">Formato DUI inválido (ej.
									01234567-8).</div>
							</div>

							<div class="col-md-6">
								<label class="form-label">Cargo</label> <input type="text"
									name="cargo" class="form-control" required maxlength="100">
								<div class="invalid-feedback">Ingresa el cargo.</div>
							</div>

							<div class="col-md-6">
								<label class="form-label">Salario</label> <input type="text"
									name="salario" class="form-control" required>
								<div class="invalid-feedback">Ingresa el salario.</div>
							</div>

						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-light"
							data-bs-dismiss="modal">Cancelar</button>
						<button type="submit" class="btn btn-primary">
							<i class="bi bi-save"></i> Guardar
						</button>
					</div>

				</form>
			</div>
		</div>
	</div>


	<!-- jQuery (requerido por DataTables) -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<!-- Bootstrap 5 (JS) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- DataTables core + Bootstrap 5 -->
	<script
		src="https://cdn.jsdelivr.net/npm/datatables.net@1.13.10/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/datatables.net-bs5@1.13.10/js/dataTables.bootstrap5.min.js"></script>
	<!-- DataTables Responsive + Bootstrap 5 -->
	<script
		src="https://cdn.jsdelivr.net/npm/datatables.net-responsive@2.5.0/js/dataTables.responsive.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/datatables.net-responsive-bs5@2.5.0/js/responsive.bootstrap5.min.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<c:if test="${sessionScope.flash == 'ok_del'}">
		<script>
    Swal.fire({
      icon: 'success',
      title: 'Eliminado',
      text: 'El registro se eliminó correctamente.',
      timer: 1600,
      showConfirmButton: false
    });
  </script>
		<c:remove var="flash" scope="session" />
	</c:if>

	<c:if test="${sessionScope.flash == 'error_del'}">
		<script>
    Swal.fire({
      icon: 'error',
      title: 'No se pudo eliminar',
      text: 'Inténtalo de nuevo.'
    });
  </script>
		<c:remove var="flash" scope="session" />
	</c:if>



	<c:if test="${sessionScope.flash == 'ok'}">
		<script>
			Swal.fire({
				icon : 'success',
				title : '¡Guardado!',
				text : 'El empleado se registró correctamente.',
				timer : 1600,
				showConfirmButton : false
			});
		</script>
		<c:remove var="flash" scope="session" />
	</c:if>

	<c:if test="${sessionScope.flash == 'error'}">
		<script>
			Swal.fire({
				icon : 'error',
				title : 'Ups',
				text : 'No se pudo guardar.'
			});
		</script>
		<c:remove var="flash" scope="session" />
	</c:if>

	<script>
		$(function() {
			$('#tabla-empleados')
					.DataTable(
							{
								responsive : true,
								pageLength : 10,
								lengthMenu : [ 5, 10, 25, 50 ],
								order : [ [ 0, 'asc' ] ],
								language : {
									url : 'https://cdn.datatables.net/plug-ins/1.13.10/i18n/es-ES.json'
								}
							});
		});
	</script>
	<script>
	function confirmarEliminar(btn) {
	    const form = btn.closest('form');
	    Swal.fire({
	      title: '¿Eliminar registro?',
	      text: 'Esta acción no se puede deshacer.',
	      icon: 'warning',
	      showCancelButton: true,
	      confirmButtonText: 'Sí, eliminar',
	      cancelButtonText: 'Cancelar',
	      reverseButtons: true
	    }).then((result) => {
	      if (result.isConfirmed) {
	        form.submit(); // ← aquí recién se envía al servlet (POST)
	      }
	    });
	  }
	</script>
</body>
</html>
