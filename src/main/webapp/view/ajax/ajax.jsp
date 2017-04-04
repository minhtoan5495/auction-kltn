<section class="content">
    <div class="container">
        <div class="row">
            <div id="ajax-response"></div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <h3>Add New Person</h3>
                <input type="text" placeholder="Enter name of person" name="name"
                    id="name" /> <input type="number"
                    placeholder="Enter age of person" name="age" id="age"> <br>
                    <input type="submit" class="btn btn-success" value="Submit"
                    onclick="addAjax()">
            </div>
            <div class="col-md-4">
                <h3>Search Person by name</h3>
                <input type="text" placeholder="Enter name of person" id="query" />
                <input type="button" class="btn btn-success" value="Submit"
                    onclick="searchAjax()">
            </div>
        </div>
    </div>
    </section>
 	<p><br></p>
 <script type="text/javascript">
 		function addAjax() {
			var name = $("#name").val();
			var age = $("#age").val();
			
			$.ajax({
				type: "GET",
				contentType: "application/json",
				url : "${pageContext.request.contextPath}/addnew/",
				data : {
					name : name,
					age : age
				},
				dataType: 'json',
				timeout : 100000,
				success : function(data){
					console.log("SUCCESS:",data);
					var result = "<h3> You just add new Person </h3>"
						+ "<strong>Name:</strong> " + data.name + "<br>"
						+ "<strong>Age:</strong> " + data.age;
				$("#ajax-response").html(result);
				},
				error :function(e){
					console.log("ERROR:", e);
				}
			});
		}
 		function searchAjax() {

			var name = $("#query").val();

			$.ajax({
				type : "GET",
				contentType : "application/json",
				url : "${pageContext.request.contextPath}/search/",
				data : {
					name : name
				},
				dataType : 'json',
				timeout : 100000,
				success : function(data) {
					console.log("SUCCESS: ", data);
					if (data != null) {
						var result = "<h3> You just search Person: "
								+ data.name + "</h3>";
						$("#ajax-response").html(result);
					} else {
						var result = "<h3 style='color:red'> No person found </h3>";
						$("#ajax-response").html(result);
					}
				},
				error : function(e) {
					console.log("ERROR: ", e);
				}
			});
		}
 </script>