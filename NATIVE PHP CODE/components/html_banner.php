<link rel="icon" type="" href="../img/icon.png">
<div class="modal fade" id="logout" role="dialog" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog">
	<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				
			</div>
			<div class="modal-body"><center>
				<div style = "font-size: 25px;">Are you sure you want to logout?</div>
			</center></div>
			<div class="modal-footer"><center>
				<a href = "../logout/logout.php"><button class="btn btn-outline-danger">Yes</button></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-outline-success" data-dismiss="modal">No</button>
			</center></div>
		</div>
	</div>
</div>	
<script>
	function logout(){
		$('#logout').modal('show');
	}

	function logout1(){
		$('#logout').modal('show');
	}
</script>