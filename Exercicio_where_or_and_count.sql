/*Exercicio */

/* Considerando o que vc aprendeu sobre performance, resolva os exercicios abaixo */


--Traga os funcionarios que trabalhem
--no departamento de filmes OU no
--departamento de roupas

-- 21 | Filmes   53 | Roupas
select * from funcionarios where departamento='roupas' or departamento='filmes';
select departamento, count(*) as 'Quantidade' from funcionarios where departamento='roupas' or departamento='filmes' group by departamento;

--Como estamos trabalhando com OR e a segunda condicao é opcional
--colocamos na primeira condicao quem tem mais chances de uma saida
--verdadeira, pois a segunda condicao nao será checada nesse caso.



--O gestor de marketing pediu a lista das funcionarias (AS) = FEMININO que trabalhem no departamento 
--de filmes ou no departamento lar. Ele necessita enviar um email para as colaboradoras
--desses dois setores. OR +  AND *
--Feminino 491 ocorrencias 
select * from funcionarios where sexo='feminino';



--52 | Lar  21 Filmes
select nome, departamento, sexo from funcionarios where (sexo='feminino' and departamento='lar') or (sexo='feminino' and departamento='filmes');
select nome, departamento, sexo  from funcionarios where (sexo='feminino' and departamento='lar') or (sexo='feminino' and departamento='filmes');
--Traga os funcionarios do sexo masculino
--ou os funcionarios que trabalhem no setor Jardim

select * from funcionarios where(sexo='masculino' or departamento='jardim');

