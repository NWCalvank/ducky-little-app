<template>
  <div id="app">
    <Header msg="A Ducky Little App"/>

    <button id="download-btn" @click="download">
      Download Current Data
    </button>

    <Form />
  </div>
</template>

<script>
import Header from './components/Header.vue'
import Form from './components/Form.vue'

export default {
  name: 'app',
  components: {
    Header,
    Form
  },
  methods: {
    download: function(){
      // TODO: append today's date dynamically
      window.location = 'http://localhost:3000/reports?end_date=2018-10-27'
    }
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
