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
                Add Product
            </header>
            <div class="panel-body">
                <c:if test="${not empty error }">
                    <div class="alert alert-danger" id="message">
                            ${error}
                    </div>
                </c:if>
                <div class="form">
                    <form:form action="${pageContext.request.contextPath}/admin/saveProduct"
                               enctype="multipart/form-data" commandName="productDto"
                               class="cmxform form-horizontal tasi-form" id="addProduct"
                               method="post">
                        <div class="col-lg-2"></div>
                        <div class="col-lg-8">
                            <div class="form-group ">
                                <label for="name" class="control-label col-lg-3">Product name <span style="color: red">(*)</span></label>
                                <div class="col-lg-9">
                                    <form:input path="name" class=" form-control" required="true" placeholder="Enter product name"
                                                id="name" name="name" type="text"/>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="price" class="control-label col-lg-3">Price <span style="color: red">(*)</span></label>
                                <div class="col-lg-9">
                                    <form:input path="price" class="form-control" required="true" min="0"
                                                placeholder="Enter product price" id="price" name="price"
                                                type="number"/>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="quantity" class="control-label col-lg-3">Quantity <span style="color: red">(*)</span></label>
                                <div class="col-lg-9">
                                    <form:input path="stockQuantity" class="form-control" required="true" min="0"
                                                placeholder="Enter product quantity" id="quantity" name="quantity"
                                                type="number"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3">Manufacture Date <span style="color: red">(*)</span></label>
                                <div class="col-lg-9">
                                    <form:input path="manufactureDate" name="manufactureDate" required="true" id="manufactureDate"
                                                class="form-control form-control-inline input-medium default-date-picker"
                                                type="text" placeholder="Choose product manufacture date"
                                    />
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="category" class="control-label col-lg-3">Parent <span style="color: red">(*)</span></label>
                                <div class="col-lg-5">
                                    <select class="col-lg-9" required="true" onchange="getCategoryByParent();" style="height: 34px;" id="parent">
                                        <option>Select parent</option>
                                        <c:forEach var="parent" items="${parents}">
                                            <option value="${parent.parentId}">${parent.parentName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="category" class="control-label col-lg-3">Category <span style="color: red">(*)</span></label>
                                <div class="col-lg-5">
                                    <form:select path="categoryId" required="true" class="col-lg-9" style="height: 34px;" id="category">
                                        <option>Select category</option>
                                    </form:select>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="supplier" class="control-label col-lg-3">Supplier <span style="color: red">(*)</span></label>
                                <div class="col-lg-5">
                                    <form:select path="supplierId" required="true" class="col-lg-9" style="height: 34px;" id="supplier">
                                        <option>Select supplier</option>
                                        <c:forEach var="supplier" items="${suppliers}">
                                            <option value="${supplier.supplierId}">${supplier.supplierName}</option>
                                        </c:forEach>
                                    </form:select>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="transactionType" style="height: 34px;"
                                       class="control-label col-lg-3">Transaction Type <span style="color: red">(*)</span></label>
                                <div class="col-lg-5">
                                    <form:select path="transactionTypeId" required="true" class="col-lg-9" style="height: 34px;"
                                                 id="transactionType">
                                        <option>Select transaction type</option>
                                        <c:forEach var="transactionType" items="${transactionTypes}">
                                            <option value="${transactionType.transactionTypeId}">${transactionType.transactionTypeName}</option>
                                        </c:forEach>
                                    </form:select>
                                </div>
                            </div>
                            <div class="form-group last">
                                <label class="control-label col-lg-3">Image Upload <span style="color: red">(*)</span></label>
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
                                                   <form:input required="true" accept="image/gif, image/jpeg, image/png" path="image1" type="file" class="default"/>
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
                                                   <form:input required="true" path="image2" accept="image/gif, image/jpeg, image/png" type="file" class="default"/>
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
                                                   <form:input required="true" path="image3" accept="image/gif, image/jpeg, image/png" type="file" class="default"/>
                                                   </span>
                                            <a href="#" class="btn btn-danger fileupload-exists"
                                               data-dismiss="fileupload"><i class="icon-trash"></i> Remove</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group last">
                                <label class="control-label col-lg-3">Description <span style="color: red">(*)</span></label>
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
