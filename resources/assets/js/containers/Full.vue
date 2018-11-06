<template>
  <div class="app">
    <AppHeader
    v-on:addStyle = 'addStyle($event)'
    />
    <div class="app-body" v-bind:style="bgc">
      <Sidebar :navItems="nav"/>
      <main class="main">
        <breadcrumb :list="list"/>
        <div class="container-fluid">
          <router-view></router-view>
        </div>
      </main>
      <AppAside/>
    </div>
    <AppFooter/>
  </div>
</template>

<script>
import nav from '../_nav'
import { Header as AppHeader, Sidebar, Aside as AppAside, Footer as AppFooter, Breadcrumb } from '../components/'

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
  name: 'full',
  components: {
    AppHeader: AppHeader,
    Sidebar: Sidebar,
    AppAside: AppAside,
    AppFooter: AppFooter,
    Breadcrumb: Breadcrumb
  },
  data () {
    return {
      nav: nav.items,
      bgc:''
    }
  },
  methods: {
    addStyle: function(data)
    {
      console.log(data);
    },
  },
  computed: {
    name () {
      return this.$route.name
    },
    list () {
      return this.$route.matched
    }
  }
}
</script>
