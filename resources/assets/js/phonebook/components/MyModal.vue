<template>
	<b-modal :title="title"  class="modal-primary" v-model="visible"  hide-footer>
		<b-form @submit="onSubmit" novalidate>
			<div class="errorClass">
            <p>{{error}}</p>
            </div>
			<b-form-fieldset
            label="Name"
            :label-cols="3"
            :horizontal="true"	
            >
            <b-form-input type="text" id='name' v-model="information.name" required></b-form-input>
          			
          </b-form-fieldset>

          <b-form-fieldset
            label="Prezime"  
            :label-cols="3"
            :horizontal="true">
            <b-form-input type="text" v-model="information.surname"></b-form-input>
          
          </b-form-fieldset>

          <b-form-fieldset
            label="Telefon"        
            :label-cols="3"
            :horizontal="true">
            <b-form-input type="text" v-model="information.phone_number"></b-form-input>
            
          </b-form-fieldset>

          <b-form-fieldset
            label="Grad"        
            :label-cols="3"
            :horizontal="true">
            <b-form-input type="text" v-model="information.city"></b-form-input>
           
          </b-form-fieldset>

          <b-form-fieldset
            label="Ulica"        
            :label-cols="3"
            :horizontal="true">
            <b-form-input type="text" v-model="information.street"></b-form-input>
            
          </b-form-fieldset>

          <b-form-fieldset
            label="Broj"        
            :label-cols="3"
            :horizontal="true">
            <b-form-input type="number" v-model="information.house_number"></b-form-input>
            
          </b-form-fieldset> 

          <b-button type="submit" size="sm" variant="primary" style="float:right"><i class="fa fa-dot-circle-o"></i>  Pošalji</b-button>
            
  		</b-form>

	</b-modal>

</template>

<style type="text/css">
.activeClass
{
	color:red;
	display: none;
}
.errorClass
{
	color:red;
}	
</style>
<script>
	export default {
		name: 'my-modal',
		computed: {
		    
		  },
		data() {
		    return {
		      	visible: false,
		      	metod:'', 
	      		error:'',
	      		
		      	isActive:true,
		      	focused:false,
		      	information:{
		      		name:'',
				    surname:'',
				    phone_number:'',
				    city:'',
				    street:'',
				    house_number:''
		      	},	
		      	id:''	      	
			}		      
		},
		props: {
			title: {
				type: String
		    },		  
		},

		methods: {
			changeHandler: function(event) 
			{
		       this.ename=[];
		       //console.log('change');
		    },

			add: function () {

				this.$emit();
			},

			Edit: function(metod,data)
			{
				this.metod = metod;
				//console.log(data);
				this.id=data.id;
				//this.client = JSON.parse(JSON.stringify(c));
				 //prvo reset forme
				this.information.name=data.name;
			    this.information.surname=data.surname;
			    this.information.phone_number = data.phone_number;
			    this.information.city = data.city;
			    this.information.street = data.street;
			    this.information.house_number = data.house_number;
			    this.error='',
	      		
			    // a onda prikazi formu*/
				this.visible = true;
			},
			Show: function(metod)
			{
				this.metod = metod;

				 //prvo reset forme
				this.information.name='';
			    this.information.surname='';
			    this.information.phone_number = '';
			    this.information.city = '';
			    this.information.street = '';
			    this.information.house_number = '';
			    this.error='',
	      		
			    // a onda prikazi formu*/
				this.visible = true;
			},

			onSubmit (evt) {
				evt.preventDefault()
				var self=this;
				if (this.metod == 'add')
				{
					axios.post('api/create_information',this.information )
						 .then(function (response) {
							//console.log(JSON.stringify(response.data));
							//console.dir(response.data.error);
							if(response.data.status == 0)
					        {
					        	 Vue.nextTick(function () {
					        	 	//console.log(JSON.stringify(response.data));
					        	 	self.error = response.data.error;
					        	 	
					        	})
					        }
					        else
					        {
								Vue.nextTick(function () {
									self.$emit('change');
									self.information={};
						        	self.visible=false;
						        	self.error='';
						       
					        	})
							}
							
						})
						.catch(function (error) {

						});
				}

				if(this.metod == 'edit' )
				{
					axios.post('api/edit_information',{id: this.id, informations: this.information} )
						 .then(function (response) {
							//console.log(JSON.stringify(response.data));
							//console.dir(response.data.error);
							if(response.data.status == 0)
							{
					        	 Vue.nextTick(function () {
					        	 	//console.log(JSON.stringify(response.data));
					        	 	self.error = response.data.error;					        	 	
					        	})
					        }
					        else
					        {
								Vue.nextTick(function () {
									self.$emit('change');
						        	self.visible=false;
						        	self.error='';						       
					        	})
							}							
						})
						.catch(function (error) {
						});
				}

			}
		},
	}
</script>	