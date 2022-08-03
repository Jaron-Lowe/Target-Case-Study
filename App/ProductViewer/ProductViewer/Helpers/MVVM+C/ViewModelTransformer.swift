import Foundation

protocol ViewModelTransformer {
    associatedtype Inputs
    associatedtype Outputs
    
    func transform(inputs: Inputs) -> Outputs
}
