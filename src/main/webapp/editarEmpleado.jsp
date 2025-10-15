<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Editar empleado</title>
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

.form-label{ font-weight:600; }
  .card{ border-radius:1rem; }
  .card-header{ border-top-left-radius:1rem!important; border-top-right-radius:1rem!important; }
  .card-footer{ border-bottom-left-radius:1rem!important; border-bottom-right-radius:1rem!important; }

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
			<h1 class="page-title h3 mb-0">Modificar informacion del
				empleado</h1>
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="card shadow-sm border-0 rounded-4">
						<div class="card-header bg-dark text-white rounded-top-4">
							<h5 class="mb-0 d-flex align-items-center gap-2">
								<i class="bi bi-person-gear"></i> Editar empleado
							</h5>
						</div>

						<!-- SUGERENCIA: arma la URL con c:url -->
						<c:url var="urlEditar" value="/SvEmpleados">
							<c:param name="accion" value="editar" />
						</c:url>

						<form class="needs-validation" novalidate method="post"
							action="">
							<div class="card-body">
								<div class="row g-3">
									<div class="col-md-6">
										<label class="form-label">Nombre</label>
										<div class="input-group">
											<span class="input-group-text"><i class="bi bi-person"></i></span>
											<input type="text" name="nombre" class="form-control"
												value="" maxlength="100" required
												placeholder="Nombre">
											<div class="invalid-feedback">Ingresa el nombre.</div>
										</div>
									</div>

									<div class="col-md-6">
										<label class="form-label">Apellido</label>
										<div class="input-group">
											<span class="input-group-text"><i class="bi bi-person"></i></span>
											<input type="text" name="apellido" class="form-control"
												value="" maxlength="100" required
												placeholder="Apellido">
											<div class="invalid-feedback">Ingresa el apellido.</div>
										</div>
									</div>

									<div class="col-md-6">
										<label class="form-label">DUI</label>
										<div class="input-group">
											<span class="input-group-text"><i
												class="bi bi-credit-card-2-front"></i></span> <input type="text"
												name="dui" class="form-control" value=""
												pattern="^[0-9]{8}-[0-9]{1}$" placeholder="01234567-8"
												required>
											<div class="invalid-feedback">Formato DUI inválido (ej.
												01234567-8).</div>
										</div>
									</div>

									<div class="col-md-6">
										<label class="form-label">Cargo</label>
										<div class="input-group">
											<span class="input-group-text"><i
												class="bi bi-briefcase"></i></span> <input type="text" name="cargo"
												class="form-control" value=""
												maxlength="100" required
												placeholder="Ej: Analista de Sistemas">
											<div class="invalid-feedback">Ingresa el cargo.</div>
										</div>
									</div>

									<div class="col-md-6">
										<label class="form-label">Salario</label>
										<div class="input-group">
											<span class="input-group-text"><i
												class="bi bi-cash-coin"></i></span>
											<!-- Si tu BD usa DECIMAL, puedes usar type="number" step="0.01" -->
											<input type="text" name="salario" class="form-control"
												value="" required
												placeholder="Ej: 650.00">
											<div class="invalid-feedback">Ingresa el salario.</div>
										</div>
									</div>
								</div>
							</div>

							<div
								class="card-footer bg-light d-flex justify-content-between align-items-center rounded-bottom-4">
								<a href="${pageContext.request.contextPath}/SvEmpleados"
									class="btn btn-outline-secondary"> <i
									class="bi bi-arrow-left"></i> Volver
								</a>
								<button type="submit" class="btn btn-primary">
									<i class="bi bi-save"></i> Guardar cambios
								</button>
							</div>
						</form>
					</div>
				</div>
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


<!-- Validación Bootstrap (inclúyelo una sola vez en tu layout) -->
<script>
(() => {
  'use strict';
  const forms = document.querySelectorAll('.needs-validation');
  Array.from(forms).forEach(form => {
    form.addEventListener('submit', e => {
      if (!form.checkValidity()) { e.preventDefault(); e.stopPropagation(); }
      form.classList.add('was-validated');
    }, false);
  });
})();
</script>
</body>
</html>
