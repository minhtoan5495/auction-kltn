$(document).ready(function() {

    $('#saveCustomer').submit(function (e) {

        $.post('/ShoppingWeb/save', $(this).serialize(), function(customer) {
            $('#customerTableReponse').first().prepend(
                '<tr>' +
                    '<td>' + customer.id + '</td>' +
                    '<td>' + customer.firstname + '</td>' +
                    '<td>' + customer.lastname + '</td>' +
                    '<td>' + customer.age + '</td>' +
                    '<td>' + customer.email + '</td>' +
                    '<td>' + customer.address + '</td>' +
                    '<td>' + customer.phone + '</td>' +
                '</tr>'
            );
        });

        clearInputs();

        e.preventDefault();
    });

});

function clearInputs() {
    $('input[id*="Input"]').each(function () {
        $(this).val('');
    });
}

$(document).ready(function(){
	$('#button').click(function(){
		var firstname = $('#firstInput').val();
		var lastname =$('#lastInput').val();
		
		$.ajax({
			type: 'GET',
			url:"/ShoppingWeb/getJSon/"+firstname+"/"+lastname,
			dataType:'json',
			success:function(customer){
				var result= "id: "+customer.id+
				"| Name:"+customer.firstname+" "+customer.lastname+
				"| Age:"+customer.age+
				"|Email:"+customer.email+
				"|Phone:"+customer.phone+
				"|Address:"+customer.address;
				
				$("#theJson").html(result)
				clearInputs();
			},
			error:function(jqXHR,textStatus,errorThrown){
				alert("Customer"+textStatus+" "+errorThrown+"!");
			}
		});
		
	});
});
$(document).ready(function(){
	$('#search').keyup(function(e){
		var filter =$('#search').val();
		if(filter.length>0){
			loadTable(filter);
		}
		else{
			$('tr[id*="tr_"]').remove();
		}
	});
});
function loadTable(filter){
	var url="/ShoppingWeb/load/"+filter;
	$('#tbody').load(url,function(reponse,status,xhr){
		if(status=="error"){
		  var message="Sorry but there was an error:";
		  $("#info").html(message+xhr.status+" "+xhr.statusText);
		}
	});
	return false;
}
