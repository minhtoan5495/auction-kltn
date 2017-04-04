
    <h2>Find Contact By Name</h2>
    <label for="search">Search</label>
    <input type="text" id="search" name="search">
    <div id="info"></div>
    	<h2>Table Contact</h2>
		<table id="loadTable" class="table tr">
			<thead>
				<tr>
					<th>ID</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Age</th>
					<th>Email</th>
					<th>Addres</th>
					<th>Phone</th>
				</tr>
			</thead>
			<tbody id="tbody">
				  <jsp:include page="search.jsp"/>
			</tbody>
			<tfoot>
				<tr>
					<th scope="row">Spring-Ajax</th>
					<td colspan="4">JQuery Ajax</td>
				</tr>
			</tfoot>
		</table>
