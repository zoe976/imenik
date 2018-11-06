<template>
<div>
  <h1>Telefonski Imenik</h1>

  <ul>
  <li v-for="(item, index) in informations">
    {{ index }}
    <ul>
    	<li v-for="(it, surname) in item">
    		{{surname}}
    		<ul>
    			<li v-for="ime in it">
    				{{ ime.name }}, {{ ime.street }} ,{{ ime.house_number }}, {{ ime.phone_number }}
    			</li>
    		</ul>
    	</li>
    		
    </ul>
  </li>
 </ul>

</div>
</template>

<script>


export default {
  name: 'phonebook',
  data() {
	return{
		informations:{},
	}
  },
  created(){
		  var self=this;
	  	axios.get('api/get_infos')
	    .then(function (response) {
	       Vue.nextTick(function () {
	          //console.log(response.data);
	          self.informations = response.data.grouped;
	        
	      })
	    })
      
   },

}
</script>
