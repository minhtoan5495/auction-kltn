<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath}/resource/admin/assets/bootstrap-datepicker/css/datepicker.css"/>
<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath}/resource/admin/assets/bootstrap-datetimepicker/css/datetimepicker.css"/>
<section id="main-content">
    <section class="wrapper">
        <!-- page start-->
        <section class="panel">
            <header class="panel-heading">
                Edit Product
            </header>
            <div class="panel-body">
                <div class="form">
                    <form:form action="${pageContext.request.contextPath}/admin/updateProduct"
                               enctype="multipart/form-data" commandName="productDto"
                               class="cmxform form-horizontal tasi-form" id="addProduct"
                               method="post">
                        <div class="col-lg-6">
                            <div class="form-group ">
                                <input value="${product.productId}" name="productId" id="productId" hidden>
                                <label for="name" class="control-label col-lg-3">Product name</label>
                                <div class="col-lg-7">
                                    <form:input path="name" class=" form-control" placeholder="Enter product name"
                                                id="name" name="name" value="${product.name}" type="text"/>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="price" class="control-label col-lg-3">Price</label>
                                <div class="col-lg-7">
                                    <form:input path="price" value="${product.price}" class="form-control" min="0"
                                                placeholder="Enter product price" id="price" name="price"
                                                type="number"/>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="quantity" class="control-label col-lg-3">Quantity</label>
                                <div class="col-lg-7">
                                    <form:input path="stockQuantity" value="${product.stockQuantity}"
                                                class="form-control"
                                                min="0"
                                                placeholder="Enter product quantity" id="quantity" name="quantity"
                                                type="number"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3">Manufacture Date</label>
                                <div class="col-lg-7">
                                    <form:input path="manufactureDate" value="${product.manufactureDate}"
                                                name="manufactureDate" id="manufactureDate"
                                                class="form-control form-control-inline input-medium default-date-picker"
                                                type="text" placeholder="Choose product manufacture date"
                                    />
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="category" class="control-label col-lg-3">Category</label>
                                <div class="col-lg-9">
                                    <form:select path="categoryId" class="col-lg-9" style="height: 34px;" id="category">
                                        <option>Select category</option>
                                        <c:forEach var="category" items="${categories}">
                                            <c:if test="${product.category.categoryName eq category.categoryName}">
                                                <option value="${category.categoryId}"
                                                        selected>${category.categoryName}</option>
                                            </c:if>
                                            <c:if test="${product.category.categoryName ne category.categoryName }">
                                                <option value="${category.categoryId}">${category.categoryName}</option>
                                            </c:if>
                                        </c:forEach>
                                    </form:select>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="supplier" class="control-label col-lg-3">Supplier</label>
                                <div class="col-lg-9">
                                    <form:select path="supplierId" class="col-lg-9" style="height: 34px;" id="supplier">
                                        <option>Select supplier</option>
                                        <c:forEach var="supplier" items="${suppliers}">
                                            <c:if test="${product.supplier.supplierName eq supplier.supplierName}">
                                                <option value="${supplier.supplierId}"
                                                        selected>${supplier.supplierName}</option>
                                            </c:if>
                                            <c:if test="${product.supplier.supplierName ne supplier.supplierName}">
                                                <option value="${supplier.supplierId}">${supplier.supplierName}</option>
                                            </c:if>
                                        </c:forEach>
                                    </form:select>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="transactionType" style="height: 34px;"
                                       class="control-label col-lg-3">Transaction Type</label>
                                <div class="col-lg-9">
                                    <form:select path="transactionTypeId" class="col-lg-9" style="height: 34px;"
                                                 id="transactionType">
                                        <option>Select transaction type</option>
                                        <c:forEach var="transactionType" items="${transactionTypes}">
                                            <c:if test="${product.transactionType.transactionTypeName eq transactionType.transactionTypeName}">
                                                <option value="${transactionType.transactionTypeId}"
                                                        selected>${transactionType.transactionTypeName}</option>
                                            </c:if>
                                            <c:if test="${product.transactionType.transactionTypeName eq transactionType.transactionTypeName}">
                                                <option value="${transactionType.transactionTypeId}">${transactionType.transactionTypeName}</option>
                                            </c:if>
                                        </c:forEach>
                                    </form:select>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group last" id="wrapper">
                                <label class="control-label col-lg-3">Image Upload</label>
                                <div class="col-md-3">
                                    <div class="fileupload fileupload-new" data-provides="fileupload">
                                        <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
                                            <img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image"
                                                 alt=""/>
                                        </div>
                                        <div class="fileupload-preview fileupload-exists thumbnail"
                                             style="width: 200px; height: 150px; line-height: 20px;"></div>
                                        <div id = 'button-change-remove'>
                                                   <span class="btn btn-white btn-file">
                                                   <span class="fileupload-new"><i class="icon-paper-clip"></i> Select image</span>
                                                   <span class="fileupload-exists"><i
                                                           class="icon-undo"></i> Change</span>
                                                   <form:input path="image1" type="file" class="default"/>
                                                   </span>
                                            <a href="#" class="btn btn-danger fileupload-exists"
                                               data-dismiss="fileupload"><i class="icon-trash"></i> Remove</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="fileupload fileupload-new" data-provides="fileupload">
                                        <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
                                            <img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image"
                                                 alt=""/>
                                        </div>
                                        <div class="fileupload-preview fileupload-exists thumbnail"
                                             style="width: 200px; height: 150px; line-height: 20px;"></div>
                                        <div>
                                                   <span class="btn btn-white btn-file">
                                                   <span class="fileupload-new"><i class="icon-paper-clip"></i> Select image</span>
                                                   <span class="fileupload-exists"><i
                                                           class="icon-undo"></i> Change</span>
                                                   <form:input path="image2" type="file" class="default"/>
                                                   </span>
                                            <a href="#" class="btn btn-danger fileupload-exists"
                                               data-dismiss="fileupload"><i class="icon-trash"></i> Remove</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="fileupload fileupload-new" data-provides="fileupload">
                                        <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
                                            <img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image"
                                                 alt=""/>
                                        </div>
                                        <div class="fileupload-preview fileupload-exists thumbnail"
                                             style="width: 200px; height: 150px; line-height: 20px;"></div>
                                        <div>
                                                   <span class="btn btn-white btn-file">
                                                   <span class="fileupload-new"><i class="icon-paper-clip"></i> Select image</span>
                                                   <span class="fileupload-exists"><i
                                                           class="icon-undo"></i> Change</span>
                                                   <form:input path="image3" type="file" class="default"/>
                                                   </span>
                                            <a href="#" class="btn btn-danger fileupload-exists"
                                               data-dismiss="fileupload"><i class="icon-trash"></i> Remove</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                                <%--<div class="form-group last">--%>
                                <%--<label class="control-label col-lg-3">Preview</label>--%>
                                <%--<div class="col-lg-9" style="display: inline-block;" id="image_preview"></div>--%>
                                <%--</div>--%>
                            <div class="form-group last">
                                <label class="control-label col-lg-3">Description</label>
                                <div class="col-lg-9">
                                    <form:textarea path="description" class="form-control ckeditor" name="editor"
                                                   rows="6"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-offset-2 col-lg-10">
                                    <input class="btn btn-danger" value="Save" type="submit"/>
                                </div>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </section>
        <!-- page end-->
    </section>
</section>
