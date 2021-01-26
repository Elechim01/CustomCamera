//
//  CameraView.swift
//  CustomCamera
//
//  Created by Michele on 26/01/21.
//

import SwiftUI

struct CameraView: View {
    @StateObject var camera = CameraModel()
    var body: some View {
        ZStack{
//            sta per essere la cmaera view 
            CameraPreview(camera: camera)
                .ignoresSafeArea(.all,edges: .all)
            VStack{
                if camera.isTaken{
                    HStack {
                        Spacer()
                        Button(action: {
                            camera.reTake()
                        }, label: {
                            Image(systemName: "arrow.triangle.2.circlepath.camera")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                        })
                        .padding(.trailing,10)
                    }
                }
                Spacer()
                HStack{
                    
                    if camera.isTaken{
                        Button(action: {
                            if !camera.isSaved{
                                camera.savePic()
                            }
                        }, label: {
                            Text(camera.isSaved ? "Saved":"Save")
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                                .padding(.vertical,10)
                                .padding(.horizontal,20)
                                .background(Color.white)
                                .clipShape(Capsule())
                        }).padding(.leading)
                        Spacer()
                        
                    }else{
                            Button(action: {
                                camera.takePic()
                            }, label: {
                            ZStack{
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 65, height: 65)
                                Circle()
                                    .stroke(Color.white,lineWidth: 2)
                                    .frame(width: 75, height: 75)
                            }
                        })
                    }
                }.frame(height: 75)
            }
        }
        .onAppear{
            camera.Check()
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
