 
  <template>
    <div class="filter-bar ui basic segment grid">
      <div class="ui form" style="margin-top:5px; margin-bottom:5px;">
        <div class="form-inline">
          <label class="mr-sm-2">Search for:</label>
          <input type="text" v-model="filterText" class="three wide column mb-2 mr-sm-2 mb-sm-0 form-control" v-on:keyup="doFilter" @keyup.enter="doFilter" placeholder="Search...">
          <button class="btn btn-primary btn-sm" style="margin-right: 3px;" @click="doFilter">Go</button>
          <button class="btn btn-secondary btn-sm"  @click="resetFilter">Reset</button>
        </div>
      </div>
    </div>
  </template>

  <script>
  export default {
    data () {
      return {
        filterText: ''
      }
    },
    methods: {
      doFilter () {
      //this.$events.fire('filter-set', this.filterText)
      this.$emit('filter-set', this.filterText)
      
      },
      resetFilter () {
        this.filterText = ''  // clear the text in text input
        //this.$events.fire('filter-reset')
        this.$emit('filter-reset')
      }
    }
  }
</script>