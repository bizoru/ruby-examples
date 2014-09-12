a = ['perro','gato']
b = ['jirafa']
t = []

a.zip(b).each do |x,y|
	t.push(x.to_s + " " +y.to_s) 
end
puts t.inspect

