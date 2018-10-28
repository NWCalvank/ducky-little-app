<template>
  <div id="app">
    <Header msg="Welcome"/>
    <select v-model="selectedPark">
      <option v-for="park in parks" v-bind:value="park.id">
        {{ park.name }}
      </option>
    </select>
  </div>
</template>

<script>
import axios from 'axios'
import Header from './components/Header.vue'

export default {
  name: 'app',
  data: function(){
    const parksPreload = [{id: 1, name: 'Park One'}]
    return {
      parks: parksPreload,
      selectedPark: parksPreload[0].id
    }
  },
  components: {
    Header
  },
  mounted: async function(){
    const { data } = await axios.get('http://localhost:3000/parks')
    this.parks = data.records
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
