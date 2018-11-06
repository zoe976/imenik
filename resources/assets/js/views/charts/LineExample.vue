<script>
import { Line } from 'vue-chartjs'

export default Line.extend({
  data() {
    return{
      //labels:['Beograd', 'Kragujevac', 'Nis', 'Uzice'],
      //data :[],
      //label:'Podaci', 


    }
  },
  props: {
      label: {
          type: String
        },
    },

    created(){      
    },
  methods:{
    refreshGraph(labels, values)
    {
      //console.log('refreshGraph...');
      this.renderChart({
        labels: labels,
        datasets: [
          {
            label: this.label,
            backgroundColor: '#f87979',
            data: values
          }
        ]
      }, {responsive: true, maintainAspectRatio: false});

    }
  },

  mounted () {   
    // this.renderChart({
    //   labels: this.labels,
    //   datasets: [
    //     {
    //       label:this.label,
    //       backgroundColor: '#f87979',
    //       data: this.data
    //     }
    //   ]
    // }, {responsive: true, maintainAspectRatio: false})
  }
})
</script>
