<template>
  <div class="animated fadeIn">
    <div >
      <b-card header="Line Chart">
        <div class="chart-wrapper">
          <line-example ref="chart"  :label="label" />
        </div>
      </b-card>
     
    </div>
  </div>
</template>
<script>
import LineExample from '../views/charts/LineExample'

export default {
  name: 'grafic',
  components: {
   
    LineExample,
   
  },
  data() {
	return{
		label:"Podaci",
	
      }
	},
	created(){
		//this.labels=['Beograd', 'Kragujevac', 'Nis', 'Uzice'];
		//this.citydata=[3,1,2,2]
		self=this;
		//this.dataset={};
      axios.get('api/get_grafic_data')
        .then(function (response) {
           Vue.nextTick(function () {
           		var labels=[];
           		var citydata = [];
              //console.log(JSON.stringify(response.data.information));
              for (var i = 0; i < response.data.information.length; i++) {
                labels.push(response.data.information[i]['city']);
                citydata.push(response.data.information[i]['total']);                
              }

              self.$refs.chart.refreshGraph(labels, citydata);
              //console.log(self.labels);
             // console.log(self.citydata);
          })
        })
      
},
}
</script>
