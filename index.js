const getRanEm = () => (1 + Math.floor(Math.random() * 179)) * 80;
const getRanTask = () =>  (1 + Math.floor(Math.random() * 159));



const a = new Array(1000).fill(1).map((k, index) => `(${index + 1}, ${getRanEm()}, ${getRanTask()})`)