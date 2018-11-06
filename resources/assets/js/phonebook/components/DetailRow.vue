  // DetailRow.vue
  <template>
    <div @click="onClick">
      <div class="inline field">
        <label>Name: </label>
        <span>{{rowData.name}}</span>
      </div>
      <div class="inline field">
        <label>Surname: </label>
        <span>{{rowData.surmane}}</span>
      </div>
      <div class="inline field">
        <label>Broj telefona: </label>
        <span>{{rowData.phone_number}}</span>
      </div>
      <div class="inline field">
        <label>Grad: </label>
        <span>{{rowData.city}}</span>
      </div>
      <div class="inline field">
        <label>Ulica: </label>
        <span>{{rowData.street}}</span>
      </div>
      <div class="inline field">
        <label>Kućni broj: </label>
        <span>{{rowData.house_number}}</span>
      </div> 
    </div>
  </template>

  <script>
  export default {
    props: {
      rowData: {
        type: Object,
        required: true
      },
      rowIndex: {
        type: Number
      }
    },
    methods: {
      onClick (event) {
        //console.log('my-detail-row: on-click', event.target)
      }
    },
  }
  </script>