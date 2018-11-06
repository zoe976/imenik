<template>
  <div>
  <filter-bar :css="css"
    v-on:filter-set="onFilterSet"
    v-on:filter-reset="onFilterReset"
  ></filter-bar>
  <vuetable ref="vuetable" 
    api-url="api/get_informations"
    :fields="fields"
    :css="css"
    pagination-path=""
   @vuetable:pagination-data="onPaginationData" 
    :per-page="10"
    :append-params="appendParams" 
    :detail-row-component="detailRowComponent"  
   @vuetable:cell-clicked="onCellClicked"
 >
   <template slot="edit_information" slot-scope="props">
      <div class="custom-actions">
        <b-button variant="primary" size="sm" class="bottom5"   @click="onAction('editInformation', props.rowData)"><i class="fa fa-edit"></i></b-button>
      </div>
    </template>
    <template slot="delete_information" slot-scope="props">
      <div class="custom-actions">
        <b-button variant="danger" size="sm" class="bottom5"   @click="onAction('deleteInformation', props.rowData)">x</i></b-button>
      </div>
    </template>

 </vuetable>

  <div>
    <vuetable-pagination-info 
        ref="paginationInfo"  
        :css="css.pagination_info"  

    ></vuetable-pagination-info>
     <vuetable-pagination ref="pagination"
     @vuetable-pagination:change-page="onChangePage"
     :css="css.pagination"
     ></vuetable-pagination>
  </div>
</div>
</template>

<style>
.pagination {
  margin: 0;
  float: right;
}
.pagination a.page {
  border: 1px solid lightgray;
  border-radius: 3px;
  padding: 5px 10px;
  margin-right: 2px;
  cursor: pointer;
}
.pagination a.page.active {
  color: white;
  background-color: #43b6d7;
  border: 1px solid lightgray;
  border-radius: 3px;
  padding: 5px 10px;
  margin-right: 2px;
  cursor: pointer;
}
.pagination a.btn-nav {
  border: 1px solid lightgray;
  border-radius: 3px;
  padding: 5px 7px;
  margin-right: 2px;
  cursor: pointer;
}
.pagination a.btn-nav.disabled {
  color: lightgray;
  border: 1px solid lightgray;
  border-radius: 3px;
  padding: 5px 7px;
  margin-right: 2px;
  cursor: not-allowed;
}
.pagination-info {
  float: left;
  margin-top: 8px !important;

}
.vuetable-pagination-info {
  margin-top: 6px !important;
}
</style>

<script>
import Vuetable from 'vuetable-2/src/components/Vuetable'
import VuetablePagination from 'vuetable-2/src/components/VuetablePagination'
import VuetablePaginationInfo from 'vuetable-2/src/components/VuetablePaginationInfo'
import FilterBar from './FilterBar'
import VueEvents from 'vue-events'
window.Vue = require('vue')
require('vue-events')


var BootstrapStyle = {
  tableClass: 'table table-sm table-hover table-striped',
  theadClass:'thead-dark',
  loadingClass: 'loading',
  ascendingIcon: 'fa fa-sort-asc',
  descendingIcon: 'fa fa-sort-desc',
  pagination: {
    wrapperClass: 'pagination',
    activeClass: 'active',
    disabledClass: 'disabled',
    pageClass: 'page',
    linkClass: 'link',
    icons: {
        first: '',
        prev: '',
        next: '',
        last: '',
      },
  },
  pagination_info:{
    infoClass: 'pagination-info'
  }
};

export default {
  components: {
    Vuetable,
    VuetablePagination,
    VuetablePaginationInfo,
    FilterBar,
    VueEvents,
   
  },
  props: {

    fields: {
      type: Array,
      required: true
    },
    detailRowComponent: {
      type: String
    }
    
  },
  data(){
    return{
      css: BootstrapStyle,
      //sort: [],
      appendParams:{},
    }
  },
  mounted() {
    //this.$events.$on('filter-set', eventData => this.onFilterSet(eventData))
    //this.$events.$on('filter-reset', e => this.onFilterReset())
  },
   methods: { 
    //...
    refreshData(){
      //console.log('osvezavam podatke u tabeli');
      Vue.nextTick( () => this.$refs.vuetable.refresh() );
    },
    onPaginationData (paginationData) {
      //console.log("onPaginationData...");
      //console.log(JSON.stringify(paginationData));
      this.$refs.pagination.setPaginationData(paginationData)

    },
     onPaginationData (paginationData) {
        this.$refs.pagination.setPaginationData(paginationData)
        this.$refs.paginationInfo.setPaginationData(paginationData)   // <----
      },
    onChangePage (page) {
      //console.log("onChangePage...");
      this.$refs.vuetable.changePage(page)
    },
 
     onCellClicked (data, field, event) {
      // console.log('cellClicked: ', field.name)

          this.$refs.vuetable.toggleDetailRow(data.id);

      },
    onFilterSet (filterText) {
      //console.log(filterText);
      this.appendParams.filter = filterText
      Vue.nextTick( () => this.$refs.vuetable.refresh() )
    },
   onFilterReset () {
     // console.log(this.sort);
      delete this.appendParams.filter 
      this.sort = [];   
      self = this  
       Vue.nextTick( function() {
        
        self.$refs.vuetable.refresh()
      })
    },
    
    onAction (action, data) {
      //console.log('slot-actions: ' + action, data.id);
        this.$emit(action, data);
    }
  },
}
</script>