import {useAccount} from "wagmi"
import Header from "@/components/header"
import { useRouter} from "next/router"
import {useState} from 'react'

export default function Wallet(){
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
                <h3>Le montant du staking</h3>
                <input type="number" />
                <input type="submit" 
              disabled={true ? !isConnected : false} 
                value="Staker" />               
            </div>
        </section>
    </>
}