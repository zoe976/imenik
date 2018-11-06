<template>
 <div>
 	<b-button variant="primary" @click="onSearch" style="margin-bottom:5px;">Prikazi adrese iz imenika</b-button>
    <GmapMap style="width: 100%; height: 400px;" :zoom="7" :center="{lat: 44, lng: 21}"
        ref="map">
      <GmapMarker
        ref="myMarker"
        :key="index"
        v-for="(m, index) in markers"
        :position="m.position"
        :clickable="true"
        :draggable="true"
        @click="center=m.position"
      />

    </GmapMap>
  </div>
</template>
 <style>
      #map {
        width: 100%;
        height: 400px;
        background-color: grey;
      }
    </style>


<script>
export default {
  data () {
    return {
      markers: [],
      place: null,
      places: [],
      currentPlace: null,
     
    }
  },

  methods: {
  	setPlace(place) {
      this.currentPlace = place;
    },
    onSearch(){
    	this.getMarkers();
    },
  	addMarker() {
      if (this.currentPlace) {
        const marker = {
          lat: this.currentPlace.geometry.location.lat(),
          lng: this.currentPlace.geometry.location.lng()
        };
        this.markers.push({ position: marker });
        this.places.push(this.currentPlace);
        this.center = marker;
        this.currentPlace = null;
      }
    },
     getMarkers(){
  	  var self=this;
	  	axios.get('api/get_map_info')
	    .then(function (response) {
	       Vue.nextTick(function () {
	          //console.log(response.data);
	          self.markers = [];
	          var addresses = response.data.informations;
	          for(var i=0; i<addresses.length; i++)
	          {
	          	var full_address = addresses[i].city + ', ' + addresses[i].street + ', '+ addresses[i].house_number;
	          	self.addMarkerFromAddress(full_address);
	          }
	       // console.log(addresses);
	      })
	    })   
  },
    addMarkerFromAddress(full_address)
   	{
     var self = this;
     var gc = new google.maps.Geocoder();
     //console.log(gc);
     gc.geocode( { 'address': full_address}, function(results, status) 
     {
       if (status == google.maps.GeocoderStatus.OK) 
       {
         var latitude = results[0].geometry.location.lat();
         var longitude = results[0].geometry.location.lng();

         //console.log(results[0].geometry.location);
         var newm = { position:{ lat:latitude, lng:longitude } };
         self.markers.push(newm);
       } 
     });
   
   } 
  },
  mounted(){
  	// this.$refs.map.$mapCreated.then(() => {
  	// 	this.getMarkers();
  	// });
  },

}
</script>
