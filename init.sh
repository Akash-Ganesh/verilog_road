NAME=$1

mkdir $NAME
cd $NAME

mkdir "src"
mkdir "tb"
mkdir "sim"
touch "filelist.f"
echo "./src/$NAME.v" >> filelist.f
echo "./tb/tb_${NAME}.v" >> filelist.f

touch "Makefile"
echo "compile:" >> Makefile
echo "	iverilog -o ./sim/$NAME.exe -f filelist.f" >> Makefile
echo "	./sim/$NAME.exe" >> Makefile
echo "wave:" >> Makefile
echo "	gtkwave ./sim/$NAME.vcd" >> Makefile
echo "clean:" >> Makefile
echo "	rm ./sim/$NAME.exe ./sim/$NAME.vcd" >> Makefile

cd src
touch "$NAME.v"
echo "module ${NAME}(" >> $NAME.v
echo "	);" >> $NAME.v
echo "endmodule" >> $NAME.v
cd ..

cd tb
touch "tb_${NAME}.v"
echo "module tb();" >> tb_$NAME.v
echo "endmodule" >> tb_$NAME.v
cd ..

cd sim
touch .gitkeep
cd ..
