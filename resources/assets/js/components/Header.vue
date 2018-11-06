<template>
  <header class="app-header navbar">
    <button class="navbar-toggler mobile-sidebar-toggler d-lg-none" type="button" @click="mobileSidebarToggle">&#9776;</button>
    <b-link class="brand" to="#"><h6>TELEFONSKI IMENIK</h6></b-link>
    <button class="navbar-toggler sidebar-toggler d-md-down-none" type="button" @click="sidebarMinimize">&#9776;</button>
       
    <b-navbar-nav>
      <b-nav-item-dropdown right>
        <template slot="button-content">
          <span class="d-md-down-none">Izaberi boju pozadine</span>
        </template>       
        <b-dropdown-item  @click="addStyle('1')">Stil 1</b-dropdown-item>
        <b-dropdown-item @click="addStyle('2')">Stil 2</b-dropdown-item>
        <b-dropdown-item @click="addStyle('3')">Stil 3 </b-dropdown-item>
      </b-nav-item-dropdown>
    </b-navbar-nav>

    <b-navbar-nav class="ml-auto px-3">
      <b-nav-item-dropdown right>
        <template slot="button-content">
          <span class="d-md-down-none">{{user.name}}</span>
        </template> 
        <b-dropdown-item v-on:click="sendToken" ><i class="fa fa-lock"></i>Logout</b-dropdown-item>
      </b-nav-item-dropdown>
    </b-navbar-nav>

    
  </header>
</template>
<style type="text/css">
  .app-header.navbar .navbar-brand
  {
        background-size: 120px auto;
  }
  .brand
  {
    margin-left: 20px;
    
  }
  .brand:hover
  {
    text-decoration: none;
  }

</style>
<script>
var style1 = {
  backgroundColor:'#161d21',
  color:'#e4e7ea'
};
var style2 = {
  backgroundColor:'#f0f3f5',
  color:'#f86c6b'
};
var style3 = {
  backgroundColor:'#f0f3f5',
  color:'#20a8d8'
};
export default {
  name: 'headerapp',
 data () {
    return {
     style:'',
     user:{},
    }
  },
  created(){
    self=this;
    axios.get('/user')
      .then(function (response) {
        self.user = response.data.user;
        console.log(self.user);
      })
      .catch(function (error) {
        //console.log(error);
      });
   

  },
  methods: {
    sendToken(){
    //console.log(window.Laravel.csrf_token);
      axios.post('/logout')
      .then(function (response) {
        //console.log(response);
        window.location = "/";
      })
      .catch(function (error) {
        console.log(error);
      });
    },
    sidebarToggle (e) {
      e.preventDefault()
      document.body.classList.toggle('sidebar-hidden')
    },
    sidebarMinimize (e) {
      e.preventDefault()
      document.body.classList.toggle('sidebar-minimized')
    },
    mobileSidebarToggle (e) {
      e.preventDefault()
      document.body.classList.toggle('sidebar-mobile-show')
    },
    addStyle: function (data) {
      if(data == '1'){
        document.body.style.backgroundColor = "#161d21";
        document.body.style.color = "#e4e7ea";
      }
       if(data == '2'){
        document.body.style.backgroundColor = "#8f9ba6";
        document.body.style.color = "#23282c";
      }
       if(data == '3'){
        document.body.style.backgroundColor = "#f0f3f5";
        document.body.style.color = "#20a8d8";
      }
    
    //this.$emit(data);

    }
   
  }
}
</script>
