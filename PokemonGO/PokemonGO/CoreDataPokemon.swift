//
//  CoreDataPokemon.swift
//  PokemonGO
//
//  Created by Hicharles Rocha on 22/09/18.
//  Copyright © 2018 Hicharles. All rights reserved.
//

import UIKit
import CoreData

class CoreDataPokemon {
 
    //recuperar o context
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        
        return context!
    }
    
    func recuperarPokemonsCapturados(capturado: Bool) -> [Pokemon] {
        let context = self.getContext()
        
        let requisicao = Pokemon.fetchRequest() as NSFetchRequest<Pokemon>
        
        requisicao.predicate = NSPredicate(format: "capturado = %@", capturado)
        
        do {
            let pokemons = try context.fetch(requisicao) as [Pokemon]
            return pokemons
        }catch{
            return []
        }
    }
    
    func recuperarTodosPokemons() -> [Pokemon] {
        let context = self.getContext()
        
        do{
            let pokemons = try context.fetch(Pokemon.fetchRequest()) as! [Pokemon]
            
            if pokemons.count == 0 {
                self.adicionarTodosPokemons()
                return self.recuperarTodosPokemons()
            }
            
            return pokemons
        }catch{
            return []
        }
    }
    
    func salvarPokemon(pokemon: Pokemon){
        let context = self.getContext()
        pokemon.capturado = true
        
        do{
            try context.save()
        }catch{}
    }
    
    //adicionar todos os pokemons
    func adicionarTodosPokemons() {
        
        let context = self.getContext()
        
        self.criarPokemon(nome: "Mew", nomeImagem: "mew", capturado: true)
        self.criarPokemon(nome: "Meowth", nomeImagem: "meowth", capturado: false)
        
        
        do {
            try context.save()
        }catch{}
    }
    
    //criar os pokemons
    func criarPokemon(nome: String, nomeImagem: String, capturado: Bool) {
        let context = self.getContext()
        let pokemon = Pokemon(context: context)
        pokemon.nome = nome
        pokemon.nomeimagem = nomeImagem
        pokemon.capturado = capturado
    }
    
    
}
