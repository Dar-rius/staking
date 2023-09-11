import {useAccount} from "wagmi"
import Header from "@/components/header"
import { useRouter} from "next/router"
import {useState} from 'react'

export default function Token(){
    const router = useRouter()
    const {address, isConnected} = useAccount()
    return<>
        <Header/>
        <section>
            {!isConnected &&
              <p>Veillez vous connecter</p>  
            }
            {isConnected &&
              <p>{address}</p>  
            }
            <h2>Montant</h2>
            <div>
                <h3>L'adresse du destinataire</h3>
                <input type="text" />
                <h3>L'adresse du destinataire</h3>
                <input type="number" />
                <input type="submit" value="Staker" 
              disabled={true ? !isConnected : false} 
                />               
            </div>
        </section>
    </>
}