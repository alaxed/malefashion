<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <div class="container-fluid">
        <!--  Row 1 -->
        <div class="row">
          <div class="col-lg-8 d-flex align-items-strech">
            <div class="card w-100">
              <div class="card-body">
                <div class="d-sm-flex d-block align-items-center justify-content-between mb-9">
                  <div class="mb-3 mb-sm-0">
                    <h5 class="card-title fw-semibold">Sales Overview</h5>
                  </div>
                  <div>
                    <select class="form-select">
                      <option value="1">March 2023</option>
                      <option value="2">April 2023</option>
                      <option value="3">May 2023</option>
                      <option value="4">June 2023</option>
                    </select>
                  </div>
                </div>
                <div id="chart"></div>
              </div>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="row">
              <div class="col-lg-12">
                <!-- Yearly Breakup -->
                <div class="card overflow-hidden">
                  <div class="card-body p-4">
                    <h5 class="card-title mb-9 fw-semibold">Yearly Breakup</h5>
                    <div class="row align-items-center">
                      <div class="col-8">
                        <h4 class="fw-semibold mb-3">$36,358</h4>
                        <div class="d-flex align-items-center mb-3">
                          <span
                            class="me-1 rounded-circle bg-light-success round-20 d-flex align-items-center justify-content-center">
                            <i class="ti ti-arrow-up-left text-success"></i>
                          </span>
                          <p class="text-dark me-1 fs-3 mb-0">+9%</p>
                          <p class="fs-3 mb-0">last year</p>
                        </div>
                        <div class="d-flex align-items-center">
                          <div class="me-4">
                            <span class="round-8 bg-primary rounded-circle me-2 d-inline-block"></span>
                            <span class="fs-2">2023</span>
                          </div>
                          <div>
                            <span class="round-8 bg-light-primary rounded-circle me-2 d-inline-block"></span>
                            <span class="fs-2">2023</span>
                          </div>
                        </div>
                      </div>
                      <div class="col-4">
                        <div class="d-flex justify-content-center">
                          <div id="breakup"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-12">
                <!-- Monthly Earnings -->
                <div class="card">
                  <div class="card-body">
                    <div class="row alig n-items-start">
                      <div class="col-8">
                        <h5 class="card-title mb-9 fw-semibold"> Monthly Earnings </h5>
                        <h4 class="fw-semibold mb-3">$6,820</h4>
                        <div class="d-flex align-items-center pb-1">
                          <span
                            class="me-2 rounded-circle bg-light-danger round-20 d-flex align-items-center justify-content-center">
                            <i class="ti ti-arrow-down-right text-danger"></i>
                          </span>
                          <p class="text-dark me-1 fs-3 mb-0">+9%</p>
                          <p class="fs-3 mb-0">last year</p>
                        </div>
                      </div>
                      <div class="col-4">
                        <div class="d-flex justify-content-end">
                          <div
                            class="text-white bg-secondary rounded-circle p-6 d-flex align-items-center justify-content-center">
                            <i class="ti ti-currency-dollar fs-6"></i>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div id="earning"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12 d-flex align-items-stretch">
            <div class="card w-100">
              <div class="card-body p-4">
                <h5 class="card-title fw-semibold mb-4">Recent Orders</h5>
                <div class="table-responsive">
                  <table class="table text-nowrap mb-0 align-middle">
											<thead class="text-dark fs-4">
												<tr>
													<th class="border-bottom-0">
														<h6 class="fw-semibold mb-0">Id</h6>
													</th>
													<th class="border-bottom-0">
														<h6 class="fw-semibold mb-0">FullName</h6>
													</th>
													<th class="border-bottom-0">
														<h6 class="fw-semibold mb-0">Address</h6>
													</th>
													<th class="border-bottom-0">
														<h6 class="fw-semibold mb-0">Delivery</h6>
													</th>
													<th class="border-bottom-0">
														<h6 class="fw-semibold mb-0">Price</h6>
													</th>
													<th class="border-bottom-0">
														<h6 class="fw-semibold mb-0">Total items</h6>
													</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${orders}" var="order">
													<tr>
														<td class="border-bottom-0">
															<h6 class="fw-semibold mb-0">${order.orderId}</h6>
														</td>
														<td class="border-bottom-0">
															<h6 class="fw-semibold mb-1">${order.fullname}</h6> <span
															class="fw-normal">${order.email}</span>
														</td>
														<td class="border-bottom-0">
															<p class="mb-0 fw-normal">${order.address}</p>
														</td>
														<td class="border-bottom-0">
															<div class="d-flex align-items-center gap-2">
																<span
																	class="<c:choose>
    <c:when test="${order.shippingUnit.name == 'Standard Shipping'}">badge bg-primary rounded-3 fw-semibold</c:when>
    <c:otherwise>badge bg-warning rounded-3 fw-semibold</c:otherwise>
</c:choose>">
																	${order.shippingUnit.name} </span>

															</div>
														</td>
														<td class="border-bottom-0">
															<h6 class="fw-semibold mb-0 fs-4">${order.totalAmount}</h6>
														</td>
														
														<td class="border-bottom-0">
															<h6 class="fw-semibold mb-0 fs-4 text-start">
															<c:forEach var="ci" items="${cItems}">
																<c:if test="${order.orderId == ci.orders}">${ci.countItems}</c:if>
															</c:forEach>
															</h6>
														</td>
														
														<td class="border-bottom-0"><td class="border-bottom-0"><a
															class="btn btn-outline-primary fw-semibold mb-0 fs-4"
															href="/dashboard/order/edit/${order.orderId}">Detail</a></td></td>


													</tr>
												</c:forEach>
											</tbody>
										</table>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
        <c:forEach var="p" items="${products}">
          <div class="col-sm-6 col-xl-3">
            <div class="card overflow-hidden rounded-2">
              <div class="position-relative" style="height: 270px">
              <c:forEach var="i" items="${img}" >
              	<c:if test="${p.productId == i.product.productId }">
                <a href="javascript:void(0)"><img src="/img/product/${i.nameImg}" class="card-img-top rounded-0" alt="..." width="90%" height="90%"></a>
               	</c:if>
                </c:forEach>
                <a href="javascript:void(0)" class="bg-primary rounded-circle p-2 text-white d-inline-flex position-absolute bottom-0 end-0 mb-n3 me-3" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Add To Cart"><i class="ti ti-basket fs-4"></i></a>                      </div>
              <div class="card-body pt-3 p-4">
                <h6 class="fw-semibold fs-4">Boat Headphone</h6>
                <div class="d-flex align-items-center justify-content-between">
                  <h6 class="fw-semibold fs-4 mb-0">$50 <span class="ms-2 fw-normal text-muted fs-3"><del>$65</del></span></h6>
                  <ul class="list-unstyled d-flex align-items-center mb-0">
                    <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                    <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                    <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                    <li><a class="me-1" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                    <li><a class="" href="javascript:void(0)"><i class="ti ti-star text-warning"></i></a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          </c:forEach>
          
          
        </div>
      </div>