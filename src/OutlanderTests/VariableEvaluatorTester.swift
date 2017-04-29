//
//  VariableEvaluatorTester.swift
//  Outlander
//
//  Created by Joseph McBride on 4/11/17.
//  Copyright © 2017 Joe McBride. All rights reserved.
//

import Foundation
import Quick
import Nimble

class VariableEvaluatorTester : QuickSpec {

    override func spec() {

        let evaluator = VariableEvaluator()
        let gameContext = GameContext()
        let context = ScriptContext({
            return gameContext.globalVars.copyValues() as! [String:String]
        })

        describe("variable evaluator") {

            beforeEach() {
            }

            describe("evals") {
                it("longer variables first") {
                    gameContext.variable("lefthandnoun", "tongs")
                    gameContext.variable("lefthand", "icesteel tongs")

                    let result = evaluator.eval("put $lefthandnoun", context)

                    expect(result).to(equal("put tongs"))
                }

                it("replaces combined local/global vars") {
                    gameContext.variable("Arcana.LearningRate", "34")

                    context.variables["magicToTrain"] = "Arcana"

                    let result = evaluator.eval("$%magicToTrain.LearningRate", context)

                    expect(result).to(equal("34"))
                }

                it("replaces combined local variables") {
                    context.variables["Chab"] = "skullcap"
                    context.variables["ChabQuant"] = "2"
                    context.variables["percentsign"] = "%"
                    context.variables["storecode"] = "Chab"

                    let result = evaluator.eval("%percentsign%storecodeQuant", context)

                    expect(result).to(equal("2"))
                }

                it("replaces combined global vars") {
                    gameContext.variable("magicToTrain", "Arcana")
                    gameContext.variable("Arcana.LearningRate", "34")

                    let result = evaluator.eval("$$magicToTrain.LearningRate", context)

                    expect(result).to(equal("34"))
                }

                it("properly breaks with non-matched local variables") {
                    context.variables["yy"] = "xx"

                    let result = evaluator.eval("%%yy-var", context)

                    expect(result).to(equal("%xx-var"))
                }
            }
        }
    }
}
