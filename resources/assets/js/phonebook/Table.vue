<template>
	<div>
		<h1>Tabela</h1>

		<my-modal
			ref = "modalDialog"
			:title = "title"
			v-on:change = 'informationAdded()'
		></my-modal>

		<b-button variant="primary" class="bottom5"  @click="addInformation()">Dodaj nove podatke u imenik</b-button>

		<my-vuetable
			ref = "informationTable"
		 	:fields="fields"
		 	detail-row-component="my-detail-row"
		 	v-on:editInformation = 'editInformation($event)'
		 	v-on:deleteInformation = 'deleteInformation($event)'
		></my-vuetable>


	</div>
</template>

<script>

import MyModal from './components/MyModal';
import MyVuetable from './components/MyVuetable'
import FieldDefs from './components/FieldDefs.js'
import DetailRow from './components/DetailRow'
Vue.component('my-detail-row', DetailRow)

export default {
  name: 'phonetable',
  components: {
  		MyModal,
		MyVuetable,
		//'my-detail-row':DetailRow
		
	},
	data() {
		return{
			fields: FieldDefs,
			title : 'Dodaj podatke u imenik',
			moreParams: {},	


		}
	},
	methods: {

	//informacije dodate/izmenjene i tabela se rifresuje
	informationAdded: function(){
	//console.log('dodate informacije');
	this.$refs.informationTable.refreshData();

	},

    //otvara se modal sa metodom add
	addInformation: function()
	{
		this.$refs.modalDialog.Show('add');
		//this.visible = true;
	},

	//otvara se modal sa metodom edit i podacima za formu
	editInformation: function(data)
	{
		
		this.$refs.modalDialog.Edit('edit',data);
		//this.visible = true;
	},

	//brisanje iz tabele
	deleteInformation: function(data)
	{
		if(confirm("Da li ste sigurni da zelite da izbrišete podatke?"))
		{
			//console.log(data);
			self = this;
			axios.post('api/delete_information',{id: this.id} )
			 .then(function (response) {					
				self.$refs.informationTable.refreshData();	
			})
			
		}
		
	},
},

}
</script>
