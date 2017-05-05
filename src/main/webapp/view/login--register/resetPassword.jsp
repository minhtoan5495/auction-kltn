<div class="container">
	<div class="row">
		<div class="col-xs-12">
		    <h3 class="text-center">Reset Password</h3>
		    <hr/>
		    <form action="${pageContext.request.contextPath }/resetPassword" method="post">
		         <div class="form-group">
		            <label>Change Password :</label>
		            <input type="password" class="form-control" name="password"/>
		        </div>
		         <div class="form-group">
		            <label>COnfirm Password :</label>
		            <input type="password" class="form-control" name="confirmPassword"/>
		        </div>
		        <button type="submit" class="btn btn-primary btn-sm center-block">
		            Submit
		        </button>
		    </form>
		</div>
	</div>
</div>