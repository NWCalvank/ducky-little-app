<template>
  <div id="form">

    <h3>Submit Duck Feeding Data</h3>

    <form @submit.prevent="submit">
      <div class="form-section">
        <label>
          Park:
          <select v-model="selectedPark">
            <option
              v-for="park in parks"
              v-bind:key="park.key"
              v-bind:value="park.id">
              {{ park.name }}
            </option>
          </select>
        </label>
      </div>

      <div class="form-section">
        <label>
          Food:
          <select v-model="selectedFood">
            <option
              v-for="food in foods"
              v-bind:key="food.name"
              v-bind:value="food.id">
              {{ food.name }}
            </option>
          </select>
        </label>
      </div>

      <div class="form-section">
        <label>
          Amount of food (kg):
          <input type="number" v-model="amount"/>
        </label>
      </div>

      <div class="form-section">
        <label>
          Number of Ducks:
          <input type="number" v-model="duckCount"/>
        </label>
      </div>

      <div class="form-section">
        <label>
          Date (YYY-MM-DD):
          <input type="text" v-model="time"/>
        </label>
      </div>

      <div class="form-section">
        <label>
          This is a Daily Feeding:
          <input type="checkbox" v-model="daily"/>
        </label>
      </div>

      <button type="submit">Submit</button>
    </form>

    <p v-if="loading">Loading...</p>
    <p v-if="submitted">Submitted!</p>
    <p v-if="error">An error occurred</p>

  </div>
</template>

<script>
import axios from 'axios'

const apiPath = process.env.VUE_APP_API

export default {
  name: 'Form',
  props: {},
  data: function(){
    return {
      parks: [],
      foods: [],
      loading: true,
      submitted: false,
      error: false,
      selectedPark: 0,
      selectedFood: '',
      amount: 1,
      duckCount: 10,
      time: '2018-10-28',
      daily: false
    }
  },
  methods: {
    submit: async function(){
      this.loading = true
      const options = {
        park_id: this.selectedPark,
        food_id: this.selectedFood,
        amount: this.amount,
        duck_count: this.duckCount,
        time: this.time,
        daily: this.daily
      }
      const res = await axios.post(`${apiPath}/feedings`, options)
      if(res.status === 200) {
        this.submitted = true
        this.loading = false
      } else {
        this.error = true
        this.loading = false
      }
    }
  },
  mounted: async function(){
    // TODO: Make these calls in parallel
    const parksRes = await axios.get(`${apiPath}/parks`)
    this.parks = parksRes.data.records
    this.selectedPark = this.parks[0].id

    const foodRes = await axios.get(`${apiPath}/foods`)
    this.foods = foodRes.data.records
    this.selectedFood = this.foods[0].id

    this.loading = false
  }
}
</script>

<style scoped>
form {
}
.form-section {
  margin: 10px 0;
}
#form {
  margin: auto;
  max-width: 500px;
  min-width: 350px;
  padding: 30px 0;
  width: 80%;
}
</style>
