import Vue from 'vue'
import Router from 'vue-router'

// Containers
import Full from '@/containers/Full'

// Views
import Phonebook from '@/phonebook/Phonebook'
import Table from '@/phonebook/Table'
import Grafic from '@/phonebook/Grafic'
import GoogleMaps from '@/phonebook/GoogleMaps'




// Views - Icons
import FontAwesome from '@/views/icons/FontAwesome'
import SimpleLineIcons from '@/views/icons/SimpleLineIcons'



Vue.use(Router)

export default new Router({
  mode: 'hash', // Demo is living in GitHub.io, so required!
  linkActiveClass: 'open active',
  scrollBehavior: () => ({ y: 0 }),
  routes: [
    {
      path: '/',
      redirect: '/phonebook',
      name: 'Imenik',
      component: Full,
      children: [
        {
          path: 'phonebook',
          name: 'Telefonski Imenik',
          component: Phonebook
        },
        {
          path: 'table',
          name: 'Tabela',
          component: Table
        },
        {
          path: 'grafic',
          name: 'Grafik',
          component: Grafic
        },
        {
          path: 'maps',
          name: 'GoogleMaps',
          component: GoogleMaps
        }
      ]
    },
  ]
})
