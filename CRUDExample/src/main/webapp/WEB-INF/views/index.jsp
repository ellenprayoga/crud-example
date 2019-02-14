<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- Set contextRoot -->
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!-- Assets locations -->
<sf:url var="css" value="/resources/css" />
<sf:url var="js" value="/resources/js" />
<sf:url var="jquery" value="/resources/jquery" />
<sf:url var="images" value="/resources/images" />

<!DOCTYPE html>
<html>
<head>
<title>CRUD Example</title>

<!-- Bootstrap core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<style>
#title {
	text-align: center;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12">
				<h3 class="mt-4 mb-5" id="title">CRUD Example</h3>

				<table class="table">
					<thead class="thead-light">
						<tr>
							<th width="3%">ID</th>
							<th width="15%">Name</th>
							<th width="7%">Gender</th>
							<th width="27%">Address</th>
							<th width="10%">Phone</th>
							<th width="15%">Email</th>
							<th width="8%">Skill</th>
							<th width="15">Edit</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${employees}" var="employee">
							<tr>
								<td>${employee.id}</td>
								<td>${employee.name}</td>
								<td>${employee.gender}</td>
								<td>${employee.address}</td>
								<td>${employee.phoneNumber}</td>
								<td>${employee.email}</td>
								<td>${employee.skill}</td>
								<td>
									<button type="button" class="btn btn-primary"
										data-toggle="modal" data-target="#updateModal_${employee.id}"
										style="height: 35px; width: 50px">
										<img src="${images}/synchronize.png" alt="NO IMAGE"
											style="width: 20px; height: 20px; margin-top: -6px" />
									</button>
									<button type="button" class="btn btn-warning"
										data-toggle="modal" data-target="#deleteModal_${employee.id}"
										style="height: 35px; width: 50px">
										<img src="${images}/trash.png" alt="NO IMAGE"
											style="width: 20px; height: 20px; margin-top: -6px" />
									</button>
								</td>


								<!-- Update employee modal -->
								<div class="modal fade" id="updateModal_${employee.id}"
									tabindex="-1" role="dialog" aria-labelledby="updateModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="refreshModalLabel">Update
													Employee</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>

											<form:form action="${contextRoot}/updateEmployee"
												modelAttribute="employee" method="POST">
												<div class="modal-body">

													<div class="form-group row">
														<label for="id" class="col-sm-3">ID</label>
														<div class="col-sm-9">
															<form:input path="id" class="form-control"
																placeholder="ID" aria-describedby="id"
																value="${employee.id}" />
														</div>
													</div>

													<div class="form-group row">
														<label for="name" class="col-sm-3">Name</label>
														<div class="col-sm-9">
															<form:input path="name" class="form-control"
																placeholder="Name" aria-describedby="name" maxlength="50"
																value="${employee.name}" />
														</div>
													</div>

													<div class="form-group row">
														<label for="gender" class="col-sm-3">Gender</label>
														<div class="col-sm-9">
															<c:choose>
																<c:when test="${employee.gender == \"Male\"}">
																	<div class="form-check form-check-inline">
																		<form:radiobutton path="gender"
																			class="form-check-input" value="Male" checked="true" />
																		<label for="maleGender" class="form-check-label">Male</label>
																	</div>

																	<div class="form-check form-check-inline">
																		<form:radiobutton path="gender"
																			class="form-check-input" value="Female" />
																		<label for="femaleGender" class="form-check-label">Female</label>
																	</div>
																</c:when>

																<c:when test="${employee.gender == \"Female\"}">
																	<div class="form-check form-check-inline">
																		<form:radiobutton path="gender"
																			class="form-check-input" value="Male" />
																		<label for="maleGender" class="form-check-label">Male</label>
																	</div>

																	<div class="form-check form-check-inline">
																		<form:radiobutton path="gender"
																			class="form-check-input" value="Female"
																			checked="true" />
																		<label for="femaleGender" class="form-check-label">Female</label>
																	</div>
																</c:when>
															</c:choose>
														</div>
													</div>

													<div class="form-group row">
														<label for="address" class="col-sm-3">Address</label>
														<div class="col-sm-9">
															<form:input path="address" class="form-control"
																placeholder="Address" aria-describedby="address" maxlength="150"
																value="${employee.address}" />
														</div>
													</div>

													<div class="form-group row">
														<label for="phoneNumber" class="col-sm-3">Phone</label>
														<div class="col-sm-9">
															<form:input path="phoneNumber" class="form-control"
																placeholder="Phone Number"
																aria-describedby="phoneNumber" maxlength="13"
																value="${employee.phoneNumber}" />
														</div>
													</div>

													<div class="form-group row">
														<label for="email" class="col-sm-3">Email</label>
														<div class="col-sm-9">
															<form:input path="email" class="form-control"
																placeholder="Email" aria-describedby="email" maxlength="100"
																value="${employee.email}" />
														</div>
													</div>

													<div class="form-group row">
														<label for="skill" class="col-sm-3">Skill</label>
														<div class="col-sm-9">
															<form:select path="skill" class="form-control"
																aria-describedby="skill">
																<form:option value="" label="Choose..." />

																<c:forEach items="${progLangList}" var="progLang">
																	<c:choose>

																		<c:when test="${progLang == employee.skill}">
																			<form:option value="${progLang}" label="${progLang}" selected="true" />
																		</c:when>
																		
																		
																		<c:otherwise>
																			<form:option value="${progLang}" label="${progLang}" />
																		</c:otherwise>
																		
																	</c:choose>
																</c:forEach>
											
															</form:select>
														</div>
													</div>
												</div>

												<div class="modal-footer">
													<input type="submit" class="btn btn-primary" value="Update" />
												</div>
											</form:form>
										</div>
									</div>
								</div>


								<!-- Delete employee modal -->
								<div class="modal fade" id="deleteModal_${employee.id}"
									tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="deleteModalLabel">Delete
													Employee</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>

											<form action="${contextRoot}/deleteEmployee" method="POST">
												<div class="modal-body">
													<input type="hidden" name="employeeId"
														value="${employee.id}" /> Are you sure deleting this
													employee ?
												</div>

												<div class="modal-footer">
													<input type="submit" class="btn btn-primary" value="Yes"
														style="margin-right: 5px" />
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal" aria-label="Close">No</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div style="overflow: hidden">
					<button class="btn btn-success" data-toggle="modal"
						data-target="#addModal" style="float: right">Add Employee</button>

					<!-- Add employee modal -->
					<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
						aria-labelledby="addModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="addModalLabel">Add Employee</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>

								<form:form action="${contextRoot}/addEmployee"
									modelAttribute="employee" method="POST">
									<div class="modal-body">


										<div class="form-group row">
											<label for="name" class="col-sm-3">Name</label>
											<div class="col-sm-9">
												<form:input path="name" class="form-control"
													placeholder="Name" aria-describedby="name" maxlength="50"/>
											</div>
										</div>

										<div class="form-group row">
											<label for="gender" class="col-sm-3">Gender</label>
											<div class="col-sm-9">
												<div class="form-check form-check-inline">
													<form:radiobutton path="gender" class="form-check-input"
														value="Male" />
													<label for="maleGender" class="form-check-label">Male</label>
												</div>

												<div class="form-check form-check-inline">
													<form:radiobutton path="gender" class="form-check-input"
														value="Female" />
													<label for="femaleGender" class="form-check-label">Female</label>
												</div>
											</div>
										</div>

										<div class="form-group row">
											<label for="address" class="col-sm-3">Address</label>
											<div class="col-sm-9">
												<form:input path="address" class="form-control"
													placeholder="Address" aria-describedby="address" maxlength="150"/>
											</div>
										</div>

										<div class="form-group row">
											<label for="phoneNumber" class="col-sm-3">Phone</label>
											<div class="col-sm-9">
												<form:input path="phoneNumber" class="form-control"
													placeholder="Phone Number" aria-describedby="phoneNumber" maxlength="13"/>
											</div>
										</div>

										<div class="form-group row">
											<label for="email" class="col-sm-3">Email</label>
											<div class="col-sm-9">
												<form:input path="email" class="form-control"
													placeholder="Email" aria-describedby="email" maxlength="100"/>
											</div>
										</div>

										<div class="form-group row">
											<label for="skill" class="col-sm-3">Skill</label>
											<div class="col-sm-9">
												<form:select path="skill" class="form-control"
													aria-describedby="skill">
													<form:option value="" label="Choose..." />
													<form:options items="${progLangList}" />
												</form:select>
											</div>
										</div>
									</div>

									<div class="modal-footer">
										<input type="submit" class="btn btn-primary" value="Add" />
									</div>
								</form:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>





	<!-- Bootstrap core JavaScript -->
	<script src="${jquery}/jquery.min.js"></script>
	<script src="${js}/bootstrap.bundle.min.js"></script>

	<!-- My Custom JavaScript -->
	<script>
		
	</script>
</body>
</html>